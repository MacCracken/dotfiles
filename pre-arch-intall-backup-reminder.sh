```bash
#!/bin/bash
# backup-reminder.sh - CRITICAL: Run BEFORE wiping machine

echo "🚨 BACKUP CHECKLIST - DO NOT SKIP! 🚨"
echo ""
echo "📋 Items to backup BEFORE rebuild:"
echo "   ✓ ~/.ssh/ (all SSH keys and config)"
echo "   ✓ ~/.api_keys (API tokens/credentials)" 
echo "   ✓ ~/.config/git/ (Git credentials)"
echo "   ✓ ~/.gnupg/ (GPG keys if used)"
echo "   ✓ Browser bookmarks/passwords"
echo "   ✓ Any local project files not in git"
echo ""
echo "💾 Backup locations:"
echo "   - External USB drive"
echo "   - Secure cloud storage"
echo "   - Another machine via SCP"
echo ""
echo "🔍 Quick verification commands:"
echo "   ls -la ~/.ssh/"
echo "   ls -la ~/.api_keys"
echo ""
read -p "Press ENTER only after backup is COMPLETE and VERIFIED: "
echo "✅ Proceeding with setup..."
```
