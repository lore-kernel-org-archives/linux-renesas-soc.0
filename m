Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:35303 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751862AbdGaOAx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 10:00:53 -0400
Subject: Re: [PATCH V4 2/2] mfd: Add ROHM BD9571MWV-M MFD PMIC driver
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20170717204512.7075-1-marek.vasut+renesas@gmail.com>
 <20170717204512.7075-2-marek.vasut+renesas@gmail.com>
 <20170718092357.6w6yjjwny54llgqd@dell>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <60189f52-b3bc-4036-a07a-0bab9c7b36f8@gmail.com>
Date: Mon, 31 Jul 2017 16:00:50 +0200
MIME-Version: 1.0
In-Reply-To: <20170718092357.6w6yjjwny54llgqd@dell>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/18/2017 11:23 AM, Lee Jones wrote:
> On Mon, 17 Jul 2017, Marek Vasut wrote:
> 
>> Add the MFD part of the ROHM BD9571MWV-M PMIC driver and MAINTAINERS
>> entry. The MFD part only specifies the regmap bits for the PMIC and
>> binds the subdevs together.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: linux-kernel@vger.kernel.org
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Lee Jones <lee.jones@linaro.org>
>> ---
>> V2: - Change BD9571MWV_AVS_VD09_VID0,1,2,3 to BD9571MWV_AVS_VD09_VID(n)
>>     - Change BD9571MWV_AVS_DVFS_VID0,1,2,3 to BD9571MWV_AVS_DVFS_VID(n)
>>     - Make the AVS_VD09 range RW, so it can be used by the regulator
>>       driver for the VD09 regulator
>>     - Report the regmap read return values when attempting to read ID
>>       registers fails
>> V3: No change
>> V4: select REGMAP_IRQ
>> ---
>>  MAINTAINERS                   |  11 ++
>>  drivers/mfd/Kconfig           |  14 +++
>>  drivers/mfd/Makefile          |   1 +
>>  drivers/mfd/bd9571mwv.c       | 230 ++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/mfd/bd9571mwv.h | 115 +++++++++++++++++++++
>>  5 files changed, 371 insertions(+)
>>  create mode 100644 drivers/mfd/bd9571mwv.c
>>  create mode 100644 include/linux/mfd/bd9571mwv.h
> 
> Applied, thanks.

I still don't see these patches in next, why ?

-- 
Best regards,
Marek Vasut
