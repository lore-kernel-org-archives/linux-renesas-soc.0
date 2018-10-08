Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34759 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbeJHSmS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Oct 2018 14:42:18 -0400
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Date: Mon, 8 Oct 2018 13:30:47 +0200
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH 1/2] i2c: rcar: refactor private flags
Message-ID: <20181008113047.GA31984@x230>
References: <20180808075928.31107-2-wsa+renesas@sang-engineering.com>
 <20181004144756.GB25176@vmlxhi-102.adit-jv.com>
 <20181005162728.ntzslfexkecbomkc@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181005162728.ntzslfexkecbomkc@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Fri, Oct 05, 2018 at 06:27:28PM +0200, Wolfram Sang wrote:
> 
> > May I ask how exactly you spotted the "shift-31-problem" in
> > drivers/i2c/busses/i2c-rcar.c:
> >  - visual code review?
> >  - static analysis, special compiler flags?
> 
> This one. I run a set of static code analyziers when applying patches.
> One of them is 'cppcheck' which reported it.

Indeed, cppcheck reports w/o this patch:

[drivers/i2c/busses/i2c-rcar.c:972]: (error) Shifting signed 32-bit value by 31 bits is undefined behaviour
[drivers/i2c/busses/i2c-rcar.c:1008]: (error) Shifting signed 32-bit value by 31 bits is undefined behaviour

> 
> > According to feedback from GCC community [2], with 'gcc -std=gnu89',
> > shifting into (not past) the sign bit is "defined behavior" which is why
> > UBSAN doesn't report this as an issue in Linux kernel. That makes me
> 
> I see. I guess it can be argued. Yet, BIT() solves other issues as well
> ('1' vs '1u'), so this was probably a reasonable move nonetheless, plus
> we are super-super-sure about the shifting now.
> 

I agree. There is no doubt that avoiding/fixing shifting into the sign
bit makes the code more portable and will lessen the pain when
switching Kbuild to C99/C11 (if ever needed). I still have open
questions, but since they go beyond i2c framework and beyond kernel
itself (as said, they originate from porting UBSan to U-Boot), I will
discuss them elsewhere.

Thanks again for the reply.

Best regards,
Eugeniu.
