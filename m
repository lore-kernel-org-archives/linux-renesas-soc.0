Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:42419 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751540AbeB0RE3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 12:04:29 -0500
Received: by mail-lf0-f67.google.com with SMTP id t204so28598222lff.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2018 09:04:28 -0800 (PST)
Subject: Re: [PATCH net-next] sh_eth: uninline TSU register accessors
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        David Miller <davem@davemloft.net>
References: <ed6bd038-fc53-b6ce-b987-a752f2be8335@cogentembedded.com>
Message-ID: <dacf296d-165e-6826-d750-7f6b0f75e4dd@cogentembedded.com>
Date: Tue, 27 Feb 2018 20:04:26 +0300
MIME-Version: 1.0
In-Reply-To: <ed6bd038-fc53-b6ce-b987-a752f2be8335@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/27/2018 02:58 PM, Sergei Shtylyov wrote:

> We have uninlined the sh_eth_{read|write}() functions introduced in the
> commit 4a55530f38e ("net: sh_eth: modify the definitions of register").
> Now remove *inline* from sh_eth_tsu_{read|write}() as  well and move
> these functions from the header to the driver itself. This saves 684
> more bytes of object code (ARM gcc 4.8.5)...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]

   David, you may want to merge this to 'net.git' instead -- the same way as you
did with the patch uninlining the basic register accessors, it's up to you...

MBR, Sergei
