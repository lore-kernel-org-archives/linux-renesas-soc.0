Return-Path: <SRS0=1qNj=EG=vger.kernel.org=linux-renesas-soc-owner@vergenet.net>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:46579 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933816AbeAKRA5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jan 2018 12:00:57 -0500
Received: by mail-lf0-f68.google.com with SMTP id a12so3520200lfe.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jan 2018 09:00:56 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20180111165432.745995666@cogentembedded.com>
Date: Thu, 11 Jan 2018 19:54:32 +0300
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: David Airlie <airlied@linux.ie>
To: Rob Herring <robh+dt@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: dri-devel@lists.freedesktop.org
To: linux-renesas-soc@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/3] Add R-Car V3M (R8A77970) support to the DU driver
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 3 patches against the 'drm-next' branch of David Airlie's
'linux.git' repo plus the patch fixing LVDCR1 for R-Car gen3 posted recently.
The main purpose of these patches is to add the R-Car V3M (R8A77970) support
to the DU driver, we have to do some refactoring first to achieve this goal...

[1/3] drm: rcar-du: lvds: refactor LVDS startup
[2/3] drm: rcar-du: add 'model' field to 'struct rcar_du_device_info'
[3/3] drm: rcar-du: add R8A77970 support

MBR, Sergei
