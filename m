Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35075 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751405AbcEKJMI (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 05:12:08 -0400
Received: by mail-io0-f193.google.com with SMTP id i75so4429247ioa.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 02:12:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <31981bb6-7243-b465-26fe-106239ff88ff@de.bosch.com>
References: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
	<1462944578-1220-2-git-send-email-dirk.behme@de.bosch.com>
	<CAMuHMdV4okk3JuJkQWjXg_XaruYrBzkmP3b4JdgXZLJQxENZ7w@mail.gmail.com>
	<40fe97f4-43e4-6a4a-6c26-d76d6f44138f@de.bosch.com>
	<CAMuHMdUREdcanmHgp2Q6tq53-G28Eh-mvxX+GK-t6RDeXZLCOw@mail.gmail.com>
	<31981bb6-7243-b465-26fe-106239ff88ff@de.bosch.com>
Date: Wed, 11 May 2016 11:12:06 +0200
Message-ID: <CAMuHMdWKnvXucqET1Y8WKMZczDw=p5gVODN9hTRG3_cdzpa2uQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] boot-mode-reg: Add core
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Dirk Behme <dirk.behme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Wed, May 11, 2016 at 10:55 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> On 11.05.2016 10:41, Geert Uytterhoeven wrote:
>> On Wed, May 11, 2016 at 10:39 AM, Dirk Behme <dirk.behme@de.bosch.com>
>> wrote:
>>> On 11.05.2016 09:54, Geert Uytterhoeven wrote:
>>>> On Wed, May 11, 2016 at 7:29 AM, Dirk Behme <dirk.behme@de.bosch.com>
>>>> wrote:
>>>>> --- /dev/null
>>>>> +++ b/drivers/misc/boot-mode-reg/core.c
>>>>> +/**
>>>>> + * boot_mode_reg_set() - record boot mode register value
>>>>> + * @mode: implementation-dependent boot mode register value
>>>>> + *
>>>>> + * Records the boot mode register value which may subsequently
>>>>> + * be retrieved using boot_mode_reg_get().
>>>>> + *
>>>>> + * return: 0 on success
>>>>> + */
>>>>> +int boot_mode_reg_set(u32 mode)
>>>>> +{
>>>>> +       int err = -EBUSY;
>>>>> +
>>>>> +       mutex_lock(&boot_mode_mutex);
>>>>> +       if (!boot_mode_is_set) {
>>>>
>>>> You've dropped the check for calling this function a subsequent time
>>>> with
>>>> a different value of mode?
>>>
>>> Sometimes inverting 'complex' if statements is not that easy ;)
>>>
>>> You mean
>>>
>>> if (!boot_mode_is_set || boot_mode != mode)
>>
>>
>> No, De Morgan says
>>
>>         if (!boot_mode_is_set || boot_mode == mode)
>
> Hmm, sorry if I don't have enough coffee today ;)
>
> But why should we do
>
> if (... boot_mode == mode)
>         boot_mode = mode;
>
> ?
>
> Or in other words:
>
> We want to execute the if code if
>
> boot_mode_is_set is false
>
> or
>
> boot_mode is not equal mode, i.e. mode has changed
>
> ?

We want to fail if the mode has changed.
Doing the assignment a second time doesn't hurt.

But as this seems to hurt readability, the better solution may be:

        if (!boot_mode_is_set) {
                boot_mode = mode;
                boot_mode_is_set = true;
                err = 0;
        } else if (boot_mode == mode) {
               err = 0;
        } else {
               err = -EBUSY;
        }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
