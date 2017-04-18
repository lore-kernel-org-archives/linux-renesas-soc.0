Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:35214 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755400AbdDRJUZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 05:20:25 -0400
Received: by mail-lf0-f50.google.com with SMTP id 75so77510223lfs.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Apr 2017 02:20:25 -0700 (PDT)
Subject: Re: [PATCH/RFT] sata: rcar_sata: Reset SATA PHY on resume
To: Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
References: <1492498973-2969-1-git-send-email-horms+renesas@verge.net.au>
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>, linux-ide@vger.kernel.org,
        Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <308de569-b3a7-8909-c07c-6d39cab5b287@cogentembedded.com>
Date: Tue, 18 Apr 2017 12:20:20 +0300
MIME-Version: 1.0
In-Reply-To: <1492498973-2969-1-git-send-email-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 4/18/2017 10:02 AM, Simon Horman wrote:

> In the case where power is cut on suspend the SATA PHY state needs to be
> suspended on resume.
>
> This is the case on the Salvator-X board with the r8a7795 or r8a7796 SoC.
> In that environment it has been observed that SATA partitions cannot not be
> accessed on resume.
>
> Based on work by Khiem Nguyen.
>
> Cc: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> * Compile and boot tested only
> ---
>  drivers/ata/sata_rcar.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

    Why the scope prefix in the subject is not just "sata_rcar: "? :-)

[...]

MBR, Sergei
