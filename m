Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:51963 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753186AbeFFQO3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 12:14:29 -0400
Subject: Re: [PATCH v5 04/14] mfd: da9063: Use REGMAP_IRQ_REG
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20180606100003.17067-1-marek.vasut+renesas@gmail.com>
 <20180606100003.17067-4-marek.vasut+renesas@gmail.com>
 <CAMuHMdXdoAaBbx+_G3+n=e+zki3z20t7ATXttDUnmYRu95HMVA@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <3317638e-8688-35ef-ab61-7281312f2c3f@gmail.com>
Date: Wed, 6 Jun 2018 18:06:00 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXdoAaBbx+_G3+n=e+zki3z20t7ATXttDUnmYRu95HMVA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/06/2018 01:31 PM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Wed, Jun 6, 2018 at 11:59 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> Convert the regmap_irq table to use REGMAP_IRQ_REG().
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Again:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Added.

And the obvious question is, what do you all use to collect these tags?
Doing it manually sucks.

-- 
Best regards,
Marek Vasut
