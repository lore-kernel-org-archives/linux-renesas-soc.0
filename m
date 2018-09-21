Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46060 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728149AbeIUVs1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Sep 2018 17:48:27 -0400
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] kernel/bounds: Provide prototype for foo
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20180921142234.16882-1-kieran.bingham+renesas@ideasonboard.com>
 <20180921144527.GB16316@kroah.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <6436e493-a3e4-7f9e-da1f-9db50643dff8@ideasonboard.com>
Date: Fri, 21 Sep 2018 16:58:51 +0100
MIME-Version: 1.0
In-Reply-To: <20180921144527.GB16316@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Greg,

Thank you for quick response!

On 21/09/18 15:45, Greg Kroah-Hartman wrote:
> On Fri, Sep 21, 2018 at 03:22:33PM +0100, Kieran Bingham wrote:
>> kernel/bounds.c is recompiled on every build, and shows the following
>> warning when compiling with W=1:

So it turns out after a bit more checking that my statement above was a
small lie :)

My local build scripts were *causing* kernel/bounds.s to be rebuilt on
every build, which is why this stood out to me - because of two
competing compiles for the kernel image, and the dtb.

One with W=1 and the other without... (kbuild detected different flags,
and thus rebuilt the common objects)

And that's why I saw this warning on every build... and thought this was
a hot-path.


> Don't do that, you will get a lot of warnings that really don't make
> much sense.  Like this one :)


I know - but I can ignore all on my first build, then on incremental
builds where only files I change are compiled - it's much quieter :)

I see it as a benefit to compile *my* code with a higher warning level,
to prevent /me/ adding further warnings.


I realise of course this patch is just pandering to the compiler to shut
it up, as this is essentially an 'unused' dummy function from it's
perspective.

But in this instance, it's because the output is being compiled to an
assembly output (kernel/bounds.s) which is then later parsed, so there
isn't anywhere else to define the prototype, and the object code is only
referenced from the assembly output.


>>
>>   CC      kernel/bounds.s
>> linux/kernel/bounds.c:16:6: warning: no previous prototype for ‘foo’ [-Wmissing-prototypes]
>>  void foo(void)
>>       ^~~
>>
>> Provide a prototype to satisfy the compiler.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Cc: stable@vger.kernel.org
>>
>> ---
>> I compile all of my incremental builds with W=1, which allows me to know
>> instantly if I add a new compiler warning in code I generate.
>>
>> This warning always comes up and seems trivial to clean up.
>> ---
>>  kernel/bounds.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/kernel/bounds.c b/kernel/bounds.c
>> index c373e887c066..60136d937800 100644
>> --- a/kernel/bounds.c
>> +++ b/kernel/bounds.c
>> @@ -13,6 +13,8 @@
>>  #include <linux/log2.h>
>>  #include <linux/spinlock_types.h>
>>  
>> +void foo(void);
>> +
>>  void foo(void)
> 
> This file is a userspace tool that is used to later generate the
> include/generated/bounds.h file.

Well more accurately it is a file compiled directly to assembly which is
then later parsed to help generate the bounds.h file. It's not itself a
userspace tool, nothing executes this code...

It's just a compilation object to allow utilisation of the preprocessor
and compiler in ways that couldn't be done otherwise as far as I
understand it.


> If you really want to track this down and fix it properly, put the
> prototype in the .c file that ends up calling this function.  That's a
> fun task to dig through the build system to find :)

This is the only location.

The compilation output from V=1 (https://paste.debian.net/1043598/ for
the full output) shows the command generating this warning as:

  (with many flags redacted for readability)

aarch64-linux-gnu-gcc -Wp,-MD,kernel/.bounds.s.d  -nostdinc -Wall
-Wstrict-prototypes -DKBUILD_BASENAME='"bounds"'
-DKBUILD_MODNAME='"bounds"'  -fverbose-asm -S -o kernel/bounds.s
kernel/bounds.c



I still feel this patch has 'some' merit with the inaccurate leading
statement regarding this being output on every build removed from the
commit log.


What do you think ?

Worth a v2 with commit message fixed?
Or should I just drop this ?


> good luck!
> 
> greg k-h


--
Cheers

Kieran
