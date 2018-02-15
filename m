Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f178.google.com ([209.85.128.178]:36794 "EHLO
        mail-wr0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755297AbeBOKDQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 05:03:16 -0500
Received: by mail-wr0-f178.google.com with SMTP id u15so2737537wrg.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2018 02:03:16 -0800 (PST)
Subject: Re: [PATCH] ARM: shmobile: stout: enable R-Car Gen2 regulator quirk
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20180213232812.31408-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdX625D9+U1r_OnQyhwrtMBz-kdc-xtoLMtjv+Gk84p+zQ@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <2edd31a0-c9d5-fafa-2bac-37d5fefb80af@gmail.com>
Date: Thu, 15 Feb 2018 10:36:23 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX625D9+U1r_OnQyhwrtMBz-kdc-xtoLMtjv+Gk84p+zQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/14/2018 10:14 AM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Wed, Feb 14, 2018 at 12:28 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> Regulator setup is suboptimal on H2 Stout too.
> 
> Worse, Stout has 2 DA9210 regulators, so you have to add a check for a
> DA9210 at address 0x70.

Fixed

-- 
Best regards,
Marek Vasut
