Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:37666 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751810AbeEFLY0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 6 May 2018 07:24:26 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: trivial@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] reiserfs: journal: fix typo 'can by' to 'can be'
Date: Sun,  6 May 2018 13:23:51 +0200
Message-Id: <20180506112404.24872-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180506112404.24872-1-wsa+renesas@sang-engineering.com>
References: <20180506112404.24872-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 fs/reiserfs/journal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 23148c3ed67560..55704f57f78f82 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -968,7 +968,7 @@ static int reiserfs_async_progress_wait(struct super_block *s)
  * if this journal list still has commit blocks unflushed, send them to disk.
  *
  * log areas must be flushed in order (transaction 2 can't commit before
- * transaction 1) Before the commit block can by written, every other log
+ * transaction 1) Before the commit block can be written, every other log
  * block must be safely on disk
  */
 static int flush_commit_list(struct super_block *s,
-- 
2.11.0
