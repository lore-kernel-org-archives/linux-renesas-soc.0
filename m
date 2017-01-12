Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:35254 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750807AbdALLwH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2017 06:52:07 -0500
Received: by mail-lf0-f51.google.com with SMTP id m78so11262168lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2017 03:52:06 -0800 (PST)
Subject: Re: [PATCH/RFC net] ravb: Remove Rx overflow log messages
To: Simon Horman <horms+renesas@verge.net.au>,
        David Miller <davem@davemloft.net>
References: <1484210470-3095-1-git-send-email-horms+renesas@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <026e0290-f051-f60c-33bb-0c12012b0e4e@cogentembedded.com>
Date: Thu, 12 Jan 2017 14:52:02 +0300
MIME-Version: 1.0
In-Reply-To: <1484210470-3095-1-git-send-email-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/12/2017 11:41 AM, Simon Horman wrote:

> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
>
> Remove Rx overflow log messages as in an environment where logging results
> in network traffic logging may cause further overflows.
>
> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> [simon: reworked changelog]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
