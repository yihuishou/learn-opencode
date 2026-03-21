# Statistics Tutorial Word Count and Notes (Word-style)
# Chinese: each Han character counts as 1 word
# English: each word counts as 1 word

function Count-Words {
    param([string]$FilePath)
    
    # Read file content (UTF-8 encoding)
    $content = Get-Content -Path $FilePath -Raw -Encoding UTF8
    
    # Remove frontmatter (content between ---)
    $content = $content -replace '^---\r?\n.*?\r?\n---\r?\n', ''
    
    # Count Chinese characters (Unicode range: \u4e00-\u9fff)
    $chineseMatches = [regex]::Matches($content, '[\u4e00-\u9fff]')
    $cnCount = $chineseMatches.Count
    
    # Remove Chinese characters
    $noChinese = $content -replace '[\u4e00-\u9fff]', ' '
    
    # Remove Markdown syntax and punctuation
    $cleaned = $noChinese -replace '[#*|`[(){}<>:,:,.!?,,;""''''—...·\-_=+\/\\@$%^&~]', ' '
    
    # Count English words
    $englishMatches = [regex]::Matches($cleaned, '[a-zA-Z][a-zA-Z0-9]*')
    $enCount = $englishMatches.Count
    
    return $cnCount + $enCount
}

# Count all .md files under docs (excluding .vitepress directory)
$total = 0
$mdFiles = Get-ChildItem -Path docs -Filter *.md -Recurse -File |
           Where-Object { $_.FullName -notmatch '\\.vitepress\\' }

foreach ($file in $mdFiles) {
    $count = Count-Words -FilePath $file.FullName
    $total += $count
}

# Count 4K HD notes
try {
    $notes = (Get-ChildItem -Path docs\public\images -Filter *-notes.jpeg -Recurse -File |
              Where-Object { $_.Name -notmatch '\.mini\.jpeg$' }).Count
} catch {
    $notes = 0
}

# Generate JSON object
$stats = @{
    wordCount = $total
    notesCount = $notes
}

# Write JSON file
$stats | ConvertTo-Json | Out-File -FilePath docs\data\stats.json -Encoding UTF8 -Force

# Output results
Write-Host "Tutorial word count: $total"
Write-Host "4K notes: $notes images"
Write-Host "OK: docs\data\stats.json has been generated"
