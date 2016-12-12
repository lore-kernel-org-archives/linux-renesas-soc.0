Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:37006 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932340AbcLLK2c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2016 05:28:32 -0500
Received: by mail-wm0-f43.google.com with SMTP id t79so60265511wmt.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Dec 2016 02:28:32 -0800 (PST)
Subject: Re: [PATCH renesas/devel 10/13] ARM: dts: r8a7790: Use R-Car Gen 2
 fallback binding for i2c nodes
To: Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
References: <1481533902-14789-1-git-send-email-horms+renesas@verge.net.au>
 <1481533902-14789-11-git-send-email-horms+renesas@verge.net.au>
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0db5b88e-41fb-03db-fa61-48e754356901@cogentembedded.com>
Date: Mon, 12 Dec 2016 13:28:30 +0300
MIME-Version: 1.0
In-Reply-To: <1481533902-14789-11-git-send-email-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 12/12/2016 12:11 PM, Simon Horman wrote:

> Use recently added R-Car Gen 2 fallback binding for iii nodes in

    s/iii/iic/?

> DT for r8a7790 SoC.
>
> This has no run-time effect for the current driver as the initialisation
> sequence is the same for the SoC-specific binding for r8a7790 and the
> fallback binding for R-Car Gen 2.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]

MBR, Sergei
