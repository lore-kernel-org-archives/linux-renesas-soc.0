Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:49676 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752653AbdLFIWu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Dec 2017 03:22:50 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] usb: renesas_usbhs: add usbhs_pipe_clear_without_sequence() function
Date: Wed,  6 Dec 2017 17:18:32 +0900
Message-Id: <1512548313-20175-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1512548313-20175-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1512548313-20175-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds usbhs_pipe_clear_without_sequence() function.
The controller has the pipe buffer and the PIPEnCTR.ACLRM can clear
it completely. But, it's also clear the data sequence. So, the driver
needs to get the sequence before.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/pipe.c | 19 ++++++++++++++-----
 drivers/usb/renesas_usbhs/pipe.h |  2 ++
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/pipe.c b/drivers/usb/renesas_usbhs/pipe.c
index 093cd8e..9677e0e 100644
--- a/drivers/usb/renesas_usbhs/pipe.c
+++ b/drivers/usb/renesas_usbhs/pipe.c
@@ -590,10 +590,22 @@ void usbhs_pipe_clear(struct usbhs_pipe *pipe)
 	}
 }
 
-void usbhs_pipe_config_change_bfre(struct usbhs_pipe *pipe, int enable)
+/* Should call usbhsp_pipe_select() before */
+void usbhs_pipe_clear_without_sequence(struct usbhs_pipe *pipe,
+				       int needs_bfre, int bfre_enable)
 {
 	int sequence;
 
+	usbhsp_pipe_select(pipe);
+	sequence = usbhs_pipe_get_data_sequence(pipe);
+	if (needs_bfre)
+		usbhsp_pipe_cfg_set(pipe, BFRE, bfre_enable ? BFRE : 0);
+	usbhs_pipe_clear(pipe);
+	usbhs_pipe_data_sequence(pipe, sequence);
+}
+
+void usbhs_pipe_config_change_bfre(struct usbhs_pipe *pipe, int enable)
+{
 	if (usbhs_pipe_is_dcp(pipe))
 		return;
 
@@ -602,10 +614,7 @@ void usbhs_pipe_config_change_bfre(struct usbhs_pipe *pipe, int enable)
 	if (!(enable ^ !!(usbhsp_pipe_cfg_get(pipe) & BFRE)))
 		return;
 
-	sequence = usbhs_pipe_get_data_sequence(pipe);
-	usbhsp_pipe_cfg_set(pipe, BFRE, enable ? BFRE : 0);
-	usbhs_pipe_clear(pipe);
-	usbhs_pipe_data_sequence(pipe, sequence);
+	usbhs_pipe_clear_without_sequence(pipe, 1, enable);
 }
 
 static struct usbhs_pipe *usbhsp_get_pipe(struct usbhs_priv *priv, u32 type)
diff --git a/drivers/usb/renesas_usbhs/pipe.h b/drivers/usb/renesas_usbhs/pipe.h
index d3d0022..3080423 100644
--- a/drivers/usb/renesas_usbhs/pipe.h
+++ b/drivers/usb/renesas_usbhs/pipe.h
@@ -80,6 +80,8 @@ void usbhs_pipe_init(struct usbhs_priv *priv,
 					 struct usbhs_pkt *pkt, int map));
 int usbhs_pipe_get_maxpacket(struct usbhs_pipe *pipe);
 void usbhs_pipe_clear(struct usbhs_pipe *pipe);
+void usbhs_pipe_clear_without_sequence(struct usbhs_pipe *pipe,
+				       int needs_bfre, int bfre_enable);
 int usbhs_pipe_is_accessible(struct usbhs_pipe *pipe);
 void usbhs_pipe_enable(struct usbhs_pipe *pipe);
 void usbhs_pipe_disable(struct usbhs_pipe *pipe);
-- 
1.9.1
