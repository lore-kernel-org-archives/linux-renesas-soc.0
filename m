Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:36516 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754125AbcLLKcX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2016 05:32:23 -0500
Received: by mail-wm0-f45.google.com with SMTP id g23so54661919wme.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Dec 2016 02:32:22 -0800 (PST)
Subject: Re: [PATCH renesas/devel 13/13] ARM: dts: r8a7794: Use R-Car Gen 2
 fallback binding for i2c nodes
To: Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
References: <1481533902-14789-1-git-send-email-horms+renesas@verge.net.au>
 <1481533902-14789-14-git-send-email-horms+renesas@verge.net.au>
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <bb5c6e7e-59e9-2120-fae1-c49fa7168bcb@cogentembedded.com>
Date: Mon, 12 Dec 2016 13:32:20 +0300
MIME-Version: 1.0
In-Reply-To: <1481533902-14789-14-git-send-email-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/12/2016 12:11 PM, Simon Horman wrote:

> Use recently added R-Car Gen 2 fallback binding for iii nodes in

    s/iii/iic/?

> DT for r8a7794 SoC.
>
> This has no run-time effect for the current driver as the initialisation
> sequence is the same for the SoC-specific binding for r8a7794 and the
> fallback binding for R-Car Gen 2.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]

MBR, Sergei
