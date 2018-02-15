Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f177.google.com ([209.85.128.177]:41309 "EHLO
        mail-wr0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1030843AbeBONIq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 08:08:46 -0500
Received: by mail-wr0-f177.google.com with SMTP id f8so862399wrh.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2018 05:08:45 -0800 (PST)
Subject: Re: [PATCH] ARM: shmobile: stout: enable R-Car Gen2 regulator quirk
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20180213232812.31408-1-marek.vasut+renesas@gmail.com>
 <20180214055800.od5yhgo753522yah@katana>
 <CAMuHMdU3opUTcOY-UeH4ArB+50_drPhGSoxP-m85p9V36fvTHg@mail.gmail.com>
 <ae3206a3-4735-87c8-9688-3acdbf06cc36@gmail.com>
 <CAMuHMdU4_wVcKwjB1ZQzfgp8vCDs92F1o+v4UyZ0bsRDfJD1vQ@mail.gmail.com>
 <15de7079-f43e-1e76-2a99-7232498b077a@gmail.com>
 <20180215104423.jj5msnd2evajzwpw@katana>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <064d2718-804c-dd75-5b24-b4c3175b3b7a@gmail.com>
Date: Thu, 15 Feb 2018 11:53:45 +0100
MIME-Version: 1.0
In-Reply-To: <20180215104423.jj5msnd2evajzwpw@katana>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/15/2018 11:44 AM, Wolfram Sang wrote:
> 
>>> BTW, several PPC platforms use of_device_compatible_match(of_root, ...),
>>> but I believe of_root is not guaranteed to be set up.
>>
>> OK, subsequent patch then. Added to TODO.
> 
> Can you place it below the PCIE patches, please? ;)

Grumble, yeah.

-- 
Best regards,
Marek Vasut
