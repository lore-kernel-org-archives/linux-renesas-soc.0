Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:40002 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753875AbeALUPv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jan 2018 15:15:51 -0500
Received: by mail-lf0-f67.google.com with SMTP id v74so5228016lfa.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jan 2018 12:15:50 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20180112201203.532200001@cogentembedded.com>
Date: Fri, 12 Jan 2018 23:12:03 +0300
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Fix LVDS startup sequences in the R-Car DU driver...
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against the 'drmf-ixes' branch of David Airlie's
'linux.git' repo plus the patch fixing LVDCR1 for R-Car gen3 posted recently.
Documentation check against the recent manuals revealed that the LVDS startup
sequences don't match those. I was able to test the gen3 patch on V3M, gen2
patch remained untested because the DU support on the Porter board is borked,
hopefully Laurent can test the gen2 patch on Lager...

[1/2] drm: rcar-du: lvds: fix LVDS startup on R-Car gen3
[2/2] drm: rcar-du: lvds: fix LVDS startup on R-Car gen2

MBR, Sergei
