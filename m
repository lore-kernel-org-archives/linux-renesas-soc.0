Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:33302 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750873AbdBAP4v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2017 10:56:51 -0500
Received: by mail-lf0-f42.google.com with SMTP id x1so144088618lff.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Feb 2017 07:56:50 -0800 (PST)
Subject: Re: [PATCH 2/2] sh_eth: fix wakeup event reporting from MagicPacket
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>,
        netdev@vger.kernel.org
References: <20170201144155.17123-1-niklas.soderlund+renesas@ragnatech.se>
 <20170201144155.17123-3-niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4436a62d-8856-e793-96f9-b265388046e2@cogentembedded.com>
Date: Wed, 1 Feb 2017 18:56:48 +0300
MIME-Version: 1.0
In-Reply-To: <20170201144155.17123-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/01/2017 05:41 PM, Niklas Söderlund wrote:

> If a link change interrupt happens along side the MagicPacket interrupt
> and the link change interrupt is ignored the interrupt handler will
> return and the wakeup event is not register. Fix this by moving the

    Registered?

> MagicPacket check before the link change check.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reported-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
