Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36013 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750725AbdAWJLW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 04:11:22 -0500
Received: by mail-io0-f195.google.com with SMTP id q20so14337683ioi.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2017 01:11:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <9d12d719-0866-a454-88e2-d51a695085cd@cogentembedded.com>
References: <1484917448-8320-1-git-send-email-geert+renesas@glider.be> <9d12d719-0866-a454-88e2-d51a695085cd@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Jan 2017 10:11:20 +0100
Message-ID: <CAMuHMdWzsLANJBHzw8kcf0zEWRCJxr5w2nBzgkSutq=rNftMsw@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: rcar-gen2: Add more register documentation
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Fri, Jan 20, 2017 at 5:21 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 01/20/2017 04:04 PM, Geert Uytterhoeven wrote:
>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>  arch/arm/mach-shmobile/pm-rcar-gen2.c | 40
>> +++++++++++++++++++++++++----------
>>  1 file changed, 29 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/arm/mach-shmobile/pm-rcar-gen2.c
>> b/arch/arm/mach-shmobile/pm-rcar-gen2.c
>> index dd9ac366868f4336..6ed9aa19c4d34766 100644
>> --- a/arch/arm/mach-shmobile/pm-rcar-gen2.c
>> +++ b/arch/arm/mach-shmobile/pm-rcar-gen2.c
>> @@ -20,14 +20,30 @@
>
> [...]
>>
>> +static inline u32 phys_to_sbar(phys_addr_t addr)
>> +{
>> +       return (((addr) >> 8) & 0xfffffc00);
>
>
>   It's not a macro -- innermost parens not needed...

Thanks, outermost neither ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
