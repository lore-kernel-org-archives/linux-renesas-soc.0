Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:54245 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753426AbdKJSPt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Nov 2017 13:15:49 -0500
Received: by mail-lf0-f67.google.com with SMTP id l23so12017258lfk.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Nov 2017 10:15:48 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20171110175859.365490212@cogentembedded.com>
Date: Fri, 10 Nov 2017 20:58:59 +0300
To: Linus Walleij <linus.walleij@linaro.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-gpio@vger.kernel.org
To: devicetree@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] Add Renesas R8A77970 PFC driver
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's a set of 2 patches against the 'sh-pfcl' branch of Geert Uyyterhoeven's
'renesas-drivers.git' repo. The patches add support for the R8A77970 PFC (note
that the pin pull-up/down support was removed in the last minute since that
part of the PFC driver has been reworked by Geert -- I will convert my code to
the new pull-up/down API later...

[1/2] pinctrl: sh-pfc: add PORT_GP_CFG_{6|22}() helper macros
[2/2] pinctrl: sh-pfc: add R8A77970 PFC support

MBR, Sergei
