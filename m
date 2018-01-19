Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:34870 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755830AbeASSfu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 13:35:50 -0500
Received: by mail-lf0-f51.google.com with SMTP id a204so3210961lfa.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jan 2018 10:35:49 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20180119182918.538035039@cogentembedded.com>
Date: Fri, 19 Jan 2018 21:29:18 +0300
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: David Airlie <airlied@linux.ie>
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
To: dri-devel@lists.freedesktop.org
To: linux-renesas-soc@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/3] Add R-Car V3M (R8A77970) support to the R-Car LVDS driver
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 3 patches against the 'drm-next' branch of David Airlie's
'linux.git' repo plus the patch fixing LVDS startup for R-Car gen2/3 and
Laurent Picnahrt's patches creating the R-Car LVDS bridge driver posted
recently. The main purpose of these patches is to add the R-Car V3M (R8A77970)
support to the R-Car LVDS driver -- we have to do some refactoring first to
achieve this goal...

[1/3] drm: rcar-du: lvds: refactor LVDS startup
[2/3] DT: display: renesas,lvds: document R8A77970 bindings
[3/3] drm: rcar-du: lvds: add R8A77970 support

MBR, Sergei
