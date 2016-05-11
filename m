Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:19090 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751364AbcEKIjJ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 04:39:09 -0400
Subject: Re: [PATCH v2 01/10] boot-mode-reg: Add core
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
 <1462944578-1220-2-git-send-email-dirk.behme@de.bosch.com>
 <CAMuHMdV4okk3JuJkQWjXg_XaruYrBzkmP3b4JdgXZLJQxENZ7w@mail.gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>,
	Dirk Behme <dirk.behme@gmail.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <40fe97f4-43e4-6a4a-6c26-d76d6f44138f@de.bosch.com>
Date: Wed, 11 May 2016 10:39:06 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV4okk3JuJkQWjXg_XaruYrBzkmP3b4JdgXZLJQxENZ7w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 11.05.2016 09:54, Geert Uytterhoeven wrote:
> Hi Dirk,
>
> On Wed, May 11, 2016 at 7:29 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> --- /dev/null
>> +++ b/drivers/misc/boot-mode-reg/core.c
>
>> +/**
>> + * boot_mode_reg_set() - record boot mode register value
>> + * @mode: implementation-dependent boot mode register value
>> + *
>> + * Records the boot mode register value which may subsequently
>> + * be retrieved using boot_mode_reg_get().
>> + *
>> + * return: 0 on success
>> + */
>> +int boot_mode_reg_set(u32 mode)
>> +{
>> +       int err = -EBUSY;
>> +
>> +       mutex_lock(&boot_mode_mutex);
>> +       if (!boot_mode_is_set) {
>
> You've dropped the check for calling this function a subsequent time with
> a different value of mode?


Sometimes inverting 'complex' if statements is not that easy ;)

You mean

if (!boot_mode_is_set || boot_mode != mode)

?

Best regards

Dirk
