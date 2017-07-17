Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH V3 2/2] mfd: Add ROHM BD9571MWV-M MFD PMIC driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20170502121816.10572-1-marek.vasut+renesas@gmail.com>
 <20170502121816.10572-2-marek.vasut+renesas@gmail.com>
 <CAMuHMdXmPPRA00yCOiwh1mvaGAy=g_QP=9qrupnzW+f=22Wosw@mail.gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <4d4afb13-25af-afa5-2eb1-43fe9c7aa813@gmail.com>
Date: Mon, 17 Jul 2017 22:46:02 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXmPPRA00yCOiwh1mvaGAy=g_QP=9qrupnzW+f=22Wosw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/10/2017 05:33 PM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Tue, May 2, 2017 at 2:18 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> Add the MFD part of the ROHM BD9571MWV-M PMIC driver and MAINTAINERS
>> entry. The MFD part only specifies the regmap bits for the PMIC and
>> binds the subdevs together.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: linux-kernel@vger.kernel.org
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Lee Jones <lee.jones@linaro.org>
> 
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -133,6 +133,19 @@ config MFD_BCM590XX
>>         help
>>           Support for the BCM590xx PMUs from Broadcom
>>
>> +config MFD_BD9571MWV
>> +       tristate "ROHM BD9571MWV PMIC"
>> +       select MFD_CORE
>> +       select REGMAP_I2C
> 
> Missing "select REGMAP_IRQ".
> 
> Else it fails with:

Added

-- 
Best regards,
Marek Vasut
