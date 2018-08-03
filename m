Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44430 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727257AbeHCNg7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Aug 2018 09:36:59 -0400
Received: by mail-wr1-f67.google.com with SMTP id r16-v6so5111179wrt.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Aug 2018 04:41:02 -0700 (PDT)
Subject: Re: [PATCH] ARM: shmobile: silk: Add DA9063 PMIC node
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20180730111817.5636-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdXib8fz3c41RX-70eA5w4ThM6e02ybmX=N=xXR6=F80KA@mail.gmail.com>
 <42d09bc8-a883-c3af-b0d6-0087b6e2558e@gmail.com>
 <CAMuHMdXSjLSsmU32tKo5tkS6+MipAXuVAUqkLYrXxmR07+eCEg@mail.gmail.com>
 <75d2797a-48db-4979-c059-d7359eb39cff@gmail.com>
 <20180803104811.2kfa456t7ytcft6s@katana>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <a2948be8-ee81-8357-6bae-0ba7bdbee62b@gmail.com>
Date: Fri, 3 Aug 2018 13:40:59 +0200
MIME-Version: 1.0
In-Reply-To: <20180803104811.2kfa456t7ytcft6s@katana>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/03/2018 12:48 PM, Wolfram Sang wrote:
> 
>>> Wolfram: do you like i2c slaves connected to multiple buses?
> 
> 'Like' would be an exaggeration, but if they are connected to multiple
> busses, this might be a reason to describe that. People could then in
> userspace bind/unbind to the bus they want? Not pretty, but there might
> be reasons for that?

Would that be useful for a PMIC ? I suspect it'd create quite a few
problems if the user could move PMIC between I2C busses at will and I
don't see any benefits.

-- 
Best regards,
Marek Vasut
