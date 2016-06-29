Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:35272 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750878AbcF2VTM (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 17:19:12 -0400
Received: by mail-lf0-f54.google.com with SMTP id l188so42209413lfe.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2016 14:19:11 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org,
	geert+renesas@glider.be
Subject: [PATCH 0/2] Add Renesas R8A7792 PFC support
Date: Thu, 30 Jun 2016 00:19:07 +0300
Message-ID: <1748403.xeiuK39ynx@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 2 patches against the 'devel' branch of Linus Walleij's
'linux-pinctrl.git' repo. Here we add the PFC support for the Renesas R8A7792
SoC (with a prior header cleanup).

[1/2] pinctrl: sh-pfc: fix overly long lines
[2/2] pinctrl: sh-pfc: add R8A7792 PFC support

WBR, Sergei
