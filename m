Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:33607 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755364AbdD1Ry3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Apr 2017 13:54:29 -0400
Received: by mail-lf0-f47.google.com with SMTP id 88so37904078lfr.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Apr 2017 10:54:29 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170428175027.394862575@cogentembedded.com>
Date: Fri, 28 Apr 2017 20:50:27 +0300
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
To: linux-renesas-soc@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Remove reserved bits from R8A7794 PFC driver
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

   Here's a set of 2 patches against the 'devel' branch of Linus Walleij's
'linux-pinctrl.git' plus the R8A7794 PFC driver patch renaming IIC0/1 signals.
The patches remove now reserved bits and pieces from the R8A7794 PFC driver.

[1/2] pinctrl: sh-pfc: r8a7794: remove AVB_AVTP_* groups
[2/2] pinctrl: sh-pfc: r8a7794: remove reserved bits

MBR, Sergei
