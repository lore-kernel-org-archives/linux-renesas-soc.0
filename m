Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:35047 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757330AbdADMOY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2017 07:14:24 -0500
Received: by mail-lf0-f43.google.com with SMTP id b14so303266341lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Jan 2017 04:13:58 -0800 (PST)
Subject: Re: [PATCH 3/3] sh_eth: factor out sh_eth_emac_interrupt()
To: netdev@vger.kernel.org
References: <64514012.uUvlhX0YRQ@wasted.cogentembedded.com>
 <2316251.zKWDf5AMHG@wasted.cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <cab4c624-2225-beed-25f5-7bcf25b16e9b@cogentembedded.com>
Date: Wed, 4 Jan 2017 15:13:54 +0300
MIME-Version: 1.0
In-Reply-To: <2316251.zKWDf5AMHG@wasted.cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/04/2017 03:11 PM, Sergei Shtylyov wrote:

> The E-MAC interrupt (EESR.ECI) is not always caused  by an error condition,
> so  it really shouldn't be handled by sh_eth_error(). Factor out the E-MAC
> interrupt handler, sh_eth_emac_interrupt(),  removing the ECI bit from the
> EESR's values throughout the driver...
>
> Update Cogent Embedded's copyright and clean up the whitespace in Renesas'
> copyright, while at it...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

    Scrap it, I've just realized I never enable EESR.ECI...

MBR, Sergei
