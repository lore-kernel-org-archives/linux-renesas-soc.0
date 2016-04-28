Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:36392 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753265AbcD1VAp (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 28 Apr 2016 17:00:45 -0400
Received: by mail-lf0-f47.google.com with SMTP id u64so97975153lff.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Apr 2016 14:00:44 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: laurent.pinchart@ideasonboard.com, airlied@linux.ie,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/4] Add TCON support to the R-Car DU driver
Date: Fri, 29 Apr 2016 00:00:40 +0300
Message-ID: <1787748.qAADjKK4gv@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 4 patches against David Airlie's 'linux.git' repo's
'drm-next' branch. We're adding support for the TCON (timing controller) that
 is a part of the R-Car SoC and can directly drive a LCD.

[1/4] drm_mode: add-TCON encoder connector
[2/4] rcar-du: add TCON encoder driver
[3/4] rcar-du: add TCON connector driver
[4/4] rcar-du: add R8A7794 TCON support

MBR, Sergei
