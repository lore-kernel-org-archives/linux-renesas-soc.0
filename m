Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Sender: Kieran Bingham <kieran@ksquared.org.uk>
From: Kieran Bingham <kieran@bingham.xyz>
To: laurent.pinchart@ideasonboard.com,
	mchehab@osg.samsung.com,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran@bingham.xyz>
Subject: [PATCH] v4l: Extend FCP compatible list to support the FDP
Date: Thu,  9 Jun 2016 18:06:42 +0100
Message-Id: <1465492003-1554-1-git-send-email-kieran@bingham.xyz>
List-ID: <linux-renesas-soc.vger.kernel.org>

The following patch extends Laurents FCP driver to support the FCP for
FDP (FCPF) which is used by the FDP driver currently in development

This patch is of course dependant upon Laurents FCP driver series [0]
which has not yet hit mainline

[0] http://www.spinics.net/lists/linux-media/msg97302.html

Kieran Bingham (1):
  v4l: Extend FCP compatible list to support the FDP

 drivers/media/platform/rcar-fcp.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.7.4
