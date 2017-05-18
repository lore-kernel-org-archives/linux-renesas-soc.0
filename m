Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f180.google.com ([209.85.128.180]:33832 "EHLO
        mail-wr0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932358AbdERQho (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 May 2017 12:37:44 -0400
Received: by mail-wr0-f180.google.com with SMTP id l9so39827838wre.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 May 2017 09:37:43 -0700 (PDT)
Subject: Re: [PATCH 2/2] sh_eth: Do not print an error message for probe
 deferral
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        "David S . Miller" <davem@davemloft.net>
References: <1495112495-25086-1-git-send-email-geert+renesas@glider.be>
 <1495112495-25086-2-git-send-email-geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <cc02d9b2-8a40-e277-4779-980abdf5117b@cogentembedded.com>
Date: Thu, 18 May 2017 19:37:40 +0300
MIME-Version: 1.0
In-Reply-To: <1495112495-25086-2-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/18/2017 04:01 PM, Geert Uytterhoeven wrote:

> EPROBE_DEFER is not an error, hence printing an error message like
>
>     sh-eth ee700000.ethernet: failed to initialise MDIO
>
> may confuse the user.
>
> To fix this, suppress the error message in case of probe deferral.
> While at it, shorten the message, and add the actual error code.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
