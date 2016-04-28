Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ig0-f196.google.com ([209.85.213.196]:36342 "EHLO
	mail-ig0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752211AbcD1Q10 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 28 Apr 2016 12:27:26 -0400
Received: by mail-ig0-f196.google.com with SMTP id c3so12237657igl.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Apr 2016 09:27:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5702417.rnCUR69ruo@wuerfel>
References: <cover.1461730638.git.horms+renesas@verge.net.au>
	<5702417.rnCUR69ruo@wuerfel>
Date: Thu, 28 Apr 2016 18:27:25 +0200
Message-ID: <CAMuHMdWnt4ceLuu-eddbMQDSFvHHVgoyUNM2V=SYO9R0XrJDMQ@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC DT PM Domain Updates for v4.7
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	"arm@kernel.org" <arm@kernel.org>,
	linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Arnd,

On Thu, Apr 28, 2016 at 5:56 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday 27 April 2016 14:20:34 Simon Horman wrote:
>> Please consider these Renesas ARM based SoC DT pm-domain updates for v4.7.
>>
>> This pull requests is based on a merge of:
>>
>> * "[GIT PULL] Second Round of Renesas ARM Based SoC R-Car SYSC Updates for
>>   v4.7", tagged as renesas-rcar-sysc2-for-v4.7, which you have already
>>   pulled.
>> * "[GIT PULL v2] Renesas ARM Based SoC DT Updates for v4.7",
>>   tagged as renesas-dt-for-v4.7, which you have also already pulled.
>>
>> The reason for the somewhat tedious base on
>> renesas-rcar-sysc2-for-v4.7, which provides driver changes,
>> is a hard run-time dependency.
>>
>> I also have a similar set of changes for arm64 which I will send separately.
>
> Ok, I've started a next/late branch for this now, but unless something
> else comes up that needs to be sent much later, I expect to submit
> this as the last pull request at the same time as all the other ones
> for 4.7.

Thanks!

> For further clarification, am I right reading the above as meaning that
> a 4.7 kernel is expected to still work with the dts files from 4.6,
> but not the other way round?

That's correct.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
