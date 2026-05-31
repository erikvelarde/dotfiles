<?php

return (new PhpCsFixer\Config())
  ->setIndent('    ')  // 4 spaces (equivalent to your 16 width but with spaces)
  ->setLineEnding("\n")
  ->setRules([
    // Core PSR-12 rules (includes 4-space indentation)
    '@PSR12' => true,

    // Additional rules similar to your stylua preferences
    'array_syntax' => ['syntax' => 'short'],
    'no_unused_imports' => true,
    'ordered_imports' => ['sort_algorithm' => 'alpha'],
    'trailing_comma_in_multiline' => true,

    // For Laravel-specific formatting
    '@Laravel' => true,
  ]);
