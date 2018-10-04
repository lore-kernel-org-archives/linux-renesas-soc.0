Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43820 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727616AbeJDX4d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Oct 2018 19:56:33 -0400
Date: Thu, 4 Oct 2018 09:56:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: Marc Zyngier <marc.zyngier@arm.com>, broonie@kernel.org,
        geert+renesas@glider.be, linux-pm@vger.kernel.org,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        Eduardo Valentin <edubezval@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v2] thermal_hwmon: Fix the 'No sensors found' error after
 replacing the parameter NULL by the actual device
Message-ID: <20181004165647.GB16009@roeck-us.net>
References: <1538551551-3431-1-git-send-email-cv-dong@jinso.co.jp>
 <213d16cd-0303-ca1f-9167-77226aa050ed@arm.com>
 <9b648168-d804-8ee9-fafe-6d68647a6045@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b648168-d804-8ee9-fafe-6d68647a6045@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 04, 2018 at 10:29:19AM +0900, Cao Van Dong wrote:
> Dear Marc-san,
> 
> Thanks for your comment!
> 
> >>Formerly, when registering the hwmon device, we pass NULL as the device.
> >>It's not a problem.
> >>Recently, the developer has replaced the parameter NULL as the device by
> >>the actual device.
> >>This causes the "No sensors found" error. Therefore, instead of using
> >>the device we will use pass
> >
> >What does report this error? Is it a userspace application?
> 
> Below are the comments of Guente-san:
> �" The "No sensors found" message is from the "sensors" application.
> �� The device type associated with the passed device is unknown to
> �� libsensors (it is parsed from the parent device subsystem name -
> �� what is that, anyway ?). This could be addressed in libsensors,
> �� or the thermal subsystem could attach itself to a known subsystem,
> �� or the thermal subsystem must pass a pointer the parent device. "
> 
> I think the problem is the thermal subsystem must pass a pointer the parent
> device.
> 
Thinking about this more ...

We only know that passing the parent device works for your use case.
We do not know if parent device types are well defined and recognized
as supported by libsensors. As such, passing the parent device as
parameter may not always work as intended.

Unfortunately, the only means to test or evaluate this would be to
run "sensors" on all affected systems, and/or to inspect the thermal
device source code to determine all parent device types.

A better solution would have been to ensure that the device pointer
passed to hwmon is recognized by libsensors, but unfortunately it
is a bit late for that.

Guenter

> >>the parent of that device as parameter. This will sync with the
> >>processor on the hwmon core.
> >>This patch is to fix this error.
> >>
> >>This patch is based on the v4.19-rc3 tag.
> >>
> >>---
> >
> >This patch has no SoB.
> 
> I will add SoB later.
> 
> >>� drivers/thermal/thermal_hwmon.c | 2 +-
> >>� 1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>diff --git a/drivers/thermal/thermal_hwmon.c
> >>b/drivers/thermal/thermal_hwmon.c
> >>index 40c69a5..a918ba9 100644
> >>--- a/drivers/thermal/thermal_hwmon.c
> >>+++ b/drivers/thermal/thermal_hwmon.c
> >>@@ -143,7 +143,7 @@ int thermal_add_hwmon_sysfs(struct
> >>thermal_zone_device *tz)
> >>����� INIT_LIST_HEAD(&hwmon->tz_list);
> >>����� strlcpy(hwmon->type, tz->type, THERMAL_NAME_LENGTH);
> >>����� strreplace(hwmon->type, '-', '_');
> >>-��� hwmon->device = hwmon_device_register_with_info(&tz->device,
> >>hwmon->type,
> >>+��� hwmon->device = hwmon_device_register_with_info(tz->device.parent,
> >>hwmon->type,
> >>����������������������������� hwmon, NULL, NULL);
> >>����� if (IS_ERR(hwmon->device)) {
> >>��������� result = PTR_ERR(hwmon->device);
> >>
> >
> >It is not clear to me that this is any better. What is the parent device
> >in this case? Can you give an example of what breaks in the hierarchy?
> >
> >Given how close we are to to 4.19, I'd rather we revert f6b6b52ef7a54160
> >if there are userspace visible regressions.
> >
> 
> Initially, I considered your patch to be correct and went to look at the
> processor in the hwmon core. Then I created the v1 patch.
> After patch v1, I noticed that it is necessary to check for cases where the
> device has parent and if there is no parent.
> However, when looking at function hwmon_device_register_with_info() and its
> header, I see that the device parameter passed in
> must be the parent device ("* @dev: the parent device"). Therefore, I think
> it's best to pass a parent device parameter to this function.
> So, I decided to create this v2 patch.
> 
> 
> Regards,
> Dong/Jinso
> 
> 
