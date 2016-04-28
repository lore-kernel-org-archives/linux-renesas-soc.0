Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:35345 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753179AbcD1VCS (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 28 Apr 2016 17:02:18 -0400
Received: by mail-lf0-f52.google.com with SMTP id c126so111113079lfb.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Apr 2016 14:02:18 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/4] drm_mode: add TCON encoder/connector
Date: Fri, 29 Apr 2016 00:02:15 +0300
Message-ID: <19760070.fVPA1G30uu@wasted.cogentembedded.com>
In-Reply-To: <1787748.qAADjKK4gv@wasted.cogentembedded.com>
References: <1787748.qAADjKK4gv@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

TCON (Timing  Controller) usually means  a chip that drives a LCD panel.
In  our case, such controller  is a part of the Renesas R-Car SoCs. Add
the TCON encoder/connector #define's  to be used by the TCON support code
in the Renesas R-Car Display Unit (DU) driver.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 include/uapi/drm/drm_mode.h |    2 ++
 1 file changed, 2 insertions(+)

Index: linux/include/uapi/drm/drm_mode.h
===================================================================
--- linux.orig/include/uapi/drm/drm_mode.h
+++ linux/include/uapi/drm/drm_mode.h
@@ -202,6 +202,7 @@ struct drm_mode_get_plane_res {
 #define DRM_MODE_ENCODER_VIRTUAL 5
 #define DRM_MODE_ENCODER_DSI	6
 #define DRM_MODE_ENCODER_DPMST	7
+#define DRM_MODE_ENCODER_TCON	8
 
 struct drm_mode_get_encoder {
 	__u32 encoder_id;
@@ -241,6 +242,7 @@ struct drm_mode_get_encoder {
 #define DRM_MODE_CONNECTOR_eDP		14
 #define DRM_MODE_CONNECTOR_VIRTUAL      15
 #define DRM_MODE_CONNECTOR_DSI		16
+#define DRM_MODE_CONNECTOR_TCON		17
 
 struct drm_mode_get_connector {
 
