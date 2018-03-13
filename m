Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:27989 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751556AbeCMRnj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Mar 2018 13:43:39 -0400
Date: Wed, 14 Mar 2018 01:42:54 +0800
From: kbuild test robot <fengguang.wu@intel.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: kbuild-all@01.org, linux-renesas-soc@vger.kernel.org
Subject: [RFC PATCH renesas-drivers] media: vsp1: vsp1_dl_cmd_pool_create can
 be static
Message-ID: <20180313174253.GA35618@lkp-ib03>
References: <201803140159.HHeMqOzI%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201803140159.HHeMqOzI%fengguang.wu@intel.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Fixes: 02dcefdd58c7 ("media: vsp1: Provide support for extended command pools")
Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 vsp1_dl.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_dl.c b/drivers/media/platform/vsp1/vsp1_dl.c
index 6d17b8b..7b99d47 100644
--- a/drivers/media/platform/vsp1/vsp1_dl.c
+++ b/drivers/media/platform/vsp1/vsp1_dl.c
@@ -392,7 +392,7 @@ struct vsp1_extended_command_info {
  *
  * Return a pointer to a pool on success or NULL if memory can't be allocated.
  */
-struct vsp1_dl_cmd_pool *
+static struct vsp1_dl_cmd_pool *
 vsp1_dl_cmd_pool_create(struct vsp1_device *vsp1, enum vsp1_extcmd_type type,
 			unsigned int num_cmds)
 {
@@ -450,7 +450,7 @@ vsp1_dl_cmd_pool_create(struct vsp1_device *vsp1, enum vsp1_extcmd_type type,
 	return pool;
 }
 
-struct vsp1_dl_ext_cmd *vsp1_dl_ext_cmd_get(struct vsp1_dl_cmd_pool *pool)
+static struct vsp1_dl_ext_cmd *vsp1_dl_ext_cmd_get(struct vsp1_dl_cmd_pool *pool)
 {
 	struct vsp1_dl_ext_cmd *cmd = NULL;
 	unsigned long flags;
@@ -468,7 +468,7 @@ struct vsp1_dl_ext_cmd *vsp1_dl_ext_cmd_get(struct vsp1_dl_cmd_pool *pool)
 	return cmd;
 }
 
-void vsp1_dl_ext_cmd_put(struct vsp1_dl_ext_cmd *cmd)
+static void vsp1_dl_ext_cmd_put(struct vsp1_dl_ext_cmd *cmd)
 {
 	unsigned long flags;
 
@@ -483,7 +483,7 @@ void vsp1_dl_ext_cmd_put(struct vsp1_dl_ext_cmd *cmd)
 	spin_unlock_irqrestore(&cmd->pool->lock, flags);
 }
 
-void vsp1_dl_ext_cmd_pool_destroy(struct vsp1_dl_cmd_pool *pool)
+static void vsp1_dl_ext_cmd_pool_destroy(struct vsp1_dl_cmd_pool *pool)
 {
 	if (!pool)
 		return;
