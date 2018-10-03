Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:47468 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727001AbeJCOy6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Oct 2018 10:54:58 -0400
Subject: Re: [PATCH v2] thermal_hwmon: Fix the 'No sensors found' error after
 replacing the parameter NULL by the actual device
To: Cao Van Dong <cv-dong@jinso.co.jp>, broonie@kernel.org,
        geert+renesas@glider.be, linux-pm@vger.kernel.org
Cc: kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        Eduardo Valentin <edubezval@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <1538551551-3431-1-git-send-email-cv-dong@jinso.co.jp>
From: Marc Zyngier <marc.zyngier@arm.com>
Message-ID: <213d16cd-0303-ca1f-9167-77226aa050ed@arm.com>
Date: Wed, 3 Oct 2018 09:07:36 +0100
MIME-Version: 1.0
In-Reply-To: <1538551551-3431-1-git-send-email-cv-dong@jinso.co.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


On 03/10/18 08:25, Cao Van Dong wrote:
> Formerly, when registering the hwmon device, we pass NULL as the device. It's not a problem.
> Recently, the developer has replaced the parameter NULL as the device by the actual device.
> This causes the "No sensors found" error. Therefore, instead of using the device we will use pass

What does report this error? Is it a userspace application?

> the parent of that device as parameter. This will sync with the processor on the hwmon core.
> This patch is to fix this error.
> 
> This patch is based on the v4.19-rc3 tag.
> 
> ---

This patch has no SoB.

>   drivers/thermal/thermal_hwmon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_hwmon.c
> index 40c69a5..a918ba9 100644
> --- a/drivers/thermal/thermal_hwmon.c
> +++ b/drivers/thermal/thermal_hwmon.c
> @@ -143,7 +143,7 @@ int thermal_add_hwmon_sysfs(struct thermal_zone_device *tz)
>   	INIT_LIST_HEAD(&hwmon->tz_list);
>   	strlcpy(hwmon->type, tz->type, THERMAL_NAME_LENGTH);
>   	strreplace(hwmon->type, '-', '_');
> -	hwmon->device = hwmon_device_register_with_info(&tz->device, hwmon->type,
> +	hwmon->device = hwmon_device_register_with_info(tz->device.parent, hwmon->type,
>   							hwmon, NULL, NULL);
>   	if (IS_ERR(hwmon->device)) {
>   		result = PTR_ERR(hwmon->device);
> 

It is not clear to me that this is any better. What is the parent device 
in this case? Can you give an example of what breaks in the hierarchy?

Given how close we are to to 4.19, I'd rather we revert f6b6b52ef7a54160 
if there are userspace visible regressions.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
