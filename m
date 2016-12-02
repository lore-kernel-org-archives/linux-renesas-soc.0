Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 2.mo1.mail-out.ovh.net ([178.32.119.250]:55891 "EHLO
        2.mo1.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751845AbcLBROZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2016 12:14:25 -0500
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
        by mo1.mail-out.ovh.net (Postfix) with ESMTP id A1B312168C
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2016 18:05:30 +0100 (CET)
Subject: Re: [RFC 1/3] gpio-rz: Port to v3.18
To: Chris Brandt <Chris.Brandt@renesas.com>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>
References: <1480693434-9415-1-git-send-email-jacopo@jmondi.org>
 <1480693434-9415-2-git-send-email-jacopo@jmondi.org>
 <SG2PR06MB116500CB10B4B9C5CF4490598A8E0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
From: "jacopo@jmondi.org" <jacopo@jmondi.org>
Message-ID: <fa8f8758-b5b0-cc05-0170-ed5a0be9a7ef@jmondi.org>
Date: Fri, 2 Dec 2016 18:05:26 +0100
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB116500CB10B4B9C5CF4490598A8E0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On 02/12/2016 17:23, Chris Brandt wrote:
> On 12/2/2016, Jacopo Mondi wrote:
>> Fix invalid return value in gpio remove function
>>
>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>> ---
>>  drivers/gpio/gpio-rz.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpio-rz.c b/drivers/gpio/gpio-rz.c index
>> a933dab..cb8f785 100644
>> --- a/drivers/gpio/gpio-rz.c
>> +++ b/drivers/gpio/gpio-rz.c
>> @@ -175,7 +175,8 @@ static int rz_gpio_remove(struct platform_device
>> *pdev)  {
>>  	struct rz_gpio_priv *p = platform_get_drvdata(pdev);
>>
>> -	return gpiochip_remove(&p->gpio_chip);
>> +	gpiochip_remove(&p->gpio_chip);
>> +	return 0;
>>  }
>>
>>  static const struct of_device_id rz_gpio_dt_ids[] = {
>> --
>> 2.7.4
>
>
> What tree/branch is this based off?
>

Quoting the cover letter:
The series is based on branch "genmai-gpio-and-pfc" of Geert's tree at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
and target Linux v3.18

Thanks
    j



>
>
> Chris
>
