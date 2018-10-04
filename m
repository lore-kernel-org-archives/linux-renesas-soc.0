Return-Path: <cv-dong@jinso.co.jp>
Subject: Re: [PATCH v2] thermal_hwmon: Fix the 'No sensors found' error after
 replacing the parameter NULL by the actual device
To: Marc Zyngier <marc.zyngier@arm.com>, broonie@kernel.org,
        geert+renesas@glider.be, linux-pm@vger.kernel.org
Cc: kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        Eduardo Valentin <edubezval@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <1538551551-3431-1-git-send-email-cv-dong@jinso.co.jp>
 <213d16cd-0303-ca1f-9167-77226aa050ed@arm.com>
From: Cao Van Dong <cv-dong@jinso.co.jp>
Message-ID: <9b648168-d804-8ee9-fafe-6d68647a6045@jinso.co.jp>
Date: Thu, 4 Oct 2018 10:29:19 +0900
MIME-Version: 1.0
In-Reply-To: <213d16cd-0303-ca1f-9167-77226aa050ed@arm.com>
Content-Type: multipart/alternative;
 boundary="------------DC6A78B686B44976BC8942FA"
Content-Language: en-US
List-ID: <linux-renesas-soc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------DC6A78B686B44976BC8942FA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Marc-san,

Thanks for your comment!

>> Formerly, when registering the hwmon device, we pass NULL as the 
>> device. It's not a problem.
>> Recently, the developer has replaced the parameter NULL as the device 
>> by the actual device.
>> This causes the "No sensors found" error. Therefore, instead of using 
>> the device we will use pass
>
> What does report this error? Is it a userspace application?

Below are the comments of Guente-san:
  " The "No sensors found" message is from the "sensors" application.
    The device type associated with the passed device is unknown to
    libsensors (it is parsed from the parent device subsystem name -
    what is that, anyway ?). This could be addressed in libsensors,
    or the thermal subsystem could attach itself to a known subsystem,
    or the thermal subsystem must pass a pointer the parent device. "

I think the problem is the thermal subsystem must pass a pointer the 
parent device.

>> the parent of that device as parameter. This will sync with the 
>> processor on the hwmon core.
>> This patch is to fix this error.
>>
>> This patch is based on the v4.19-rc3 tag.
>>
>> ---
>
> This patch has no SoB.

I will add SoB later.

>>   drivers/thermal/thermal_hwmon.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/thermal/thermal_hwmon.c 
>> b/drivers/thermal/thermal_hwmon.c
>> index 40c69a5..a918ba9 100644
>> --- a/drivers/thermal/thermal_hwmon.c
>> +++ b/drivers/thermal/thermal_hwmon.c
>> @@ -143,7 +143,7 @@ int thermal_add_hwmon_sysfs(struct 
>> thermal_zone_device *tz)
>>       INIT_LIST_HEAD(&hwmon->tz_list);
>>       strlcpy(hwmon->type, tz->type, THERMAL_NAME_LENGTH);
>>       strreplace(hwmon->type, '-', '_');
>> -    hwmon->device = hwmon_device_register_with_info(&tz->device, 
>> hwmon->type,
>> +    hwmon->device = 
>> hwmon_device_register_with_info(tz->device.parent, hwmon->type,
>>                               hwmon, NULL, NULL);
>>       if (IS_ERR(hwmon->device)) {
>>           result = PTR_ERR(hwmon->device);
>>
>
> It is not clear to me that this is any better. What is the parent 
> device in this case? Can you give an example of what breaks in the 
> hierarchy?
>
> Given how close we are to to 4.19, I'd rather we revert 
> f6b6b52ef7a54160 if there are userspace visible regressions.
>

Initially, I considered your patch to be correct and went to look at the 
processor in the hwmon core. Then I created the v1 patch.
After patch v1, I noticed that it is necessary to check for cases where 
the device has parent and if there is no parent.
However, when looking at function hwmon_device_register_with_info() and 
its header, I see that the device parameter passed in
must be the parent device ("* @dev: the parent device"). Therefore, I 
think it's best to pass a parent device parameter to this function.
So, I decided to create this v2 patch.


Regards,
Dong/Jinso



--------------DC6A78B686B44976BC8942FA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><tt>Dear Marc-san,</tt></p>
    <p><tt>Thanks for your comment! </tt><tt><br>
      </tt></p>
    <blockquote type="cite"
      cite="mid:213d16cd-0303-ca1f-9167-77226aa050ed@arm.com">
      <blockquote type="cite"><tt>Formerly, when registering the hwmon
          device, we pass NULL as the device. It's not a problem.
        </tt><tt><br>
        </tt><tt>Recently, the developer has replaced the parameter NULL
          as the device by the actual device.
        </tt><tt><br>
        </tt><tt>This causes the "No sensors found" error. Therefore,
          instead of using the device we will use pass
        </tt><tt><br>
        </tt></blockquote>
      <tt><br>
      </tt><tt>What does report this error? Is it a userspace
        application?
      </tt><tt><br>
      </tt></blockquote>
    <tt><br>
    </tt><tt><span class="tlid-translation translation"><span title=""
          class="">Below are the comments of </span></span></tt><tt>Guente-san:</tt><tt><br>
    </tt><tt> " The "No sensors found" message is from the "sensors"
      application.
    </tt><tt><br>
    </tt><tt>   The device type associated with the passed device is
      unknown to
    </tt><tt><br>
    </tt><tt>   libsensors (it is parsed from the parent device
      subsystem name -
    </tt><tt><br>
    </tt><tt>   what is that, anyway ?). This could be addressed in
      libsensors,
    </tt><tt><br>
    </tt><tt>   or the thermal subsystem could attach itself to a known
      subsystem,
    </tt><tt><br>
    </tt><tt>   or the thermal subsystem must pass a pointer the parent
      device.
      "</tt><tt><br>
    </tt><tt><br>
    </tt><tt><span class="tlid-translation translation"><span title=""
          class="">I think the problem is </span></span></tt><tt>the
      thermal subsystem must pass a pointer the parent device.
    </tt><tt><br>
    </tt><tt><br>
    </tt>
    <blockquote type="cite"
      cite="mid:213d16cd-0303-ca1f-9167-77226aa050ed@arm.com">
      <blockquote type="cite"><tt>the parent of that device as
          parameter. This will sync with the processor on the hwmon
          core.
        </tt><tt><br>
        </tt><tt>This patch is to fix this error.
        </tt><tt><br>
        </tt>
        <tt><br>
        </tt><tt>This patch is based on the v4.19-rc3 tag.
        </tt><tt><br>
        </tt>
        <tt><br>
        </tt><tt>---
        </tt><tt><br>
        </tt></blockquote>
      <tt><br>
      </tt><tt>This patch has no SoB.
      </tt><tt><br>
      </tt></blockquote>
    <tt><br>
    </tt><tt><span class="tlid-translation translation"><span title=""
          class="">I will add SoB later.</span></span></tt><tt><br>
    </tt><tt><br>
    </tt>
    <blockquote type="cite"
      cite="mid:213d16cd-0303-ca1f-9167-77226aa050ed@arm.com">
      <blockquote type="cite"><tt>  drivers/thermal/thermal_hwmon.c | 2
          +-
        </tt><tt><br>
        </tt><tt>  1 file changed, 1 insertion(+), 1 deletion(-)
        </tt><tt><br>
        </tt>
        <tt><br>
        </tt><tt>diff --git a/drivers/thermal/thermal_hwmon.c
          b/drivers/thermal/thermal_hwmon.c
        </tt><tt><br>
        </tt><tt>index 40c69a5..a918ba9 100644
        </tt><tt><br>
        </tt><tt>--- a/drivers/thermal/thermal_hwmon.c
        </tt><tt><br>
        </tt><tt>+++ b/drivers/thermal/thermal_hwmon.c
        </tt><tt><br>
        </tt><tt>@@ -143,7 +143,7 @@ int thermal_add_hwmon_sysfs(struct
          thermal_zone_device *tz)
        </tt><tt><br>
        </tt><tt>      INIT_LIST_HEAD(&amp;hwmon-&gt;tz_list);
        </tt><tt><br>
        </tt><tt>      strlcpy(hwmon-&gt;type, tz-&gt;type,
          THERMAL_NAME_LENGTH);
        </tt><tt><br>
        </tt><tt>      strreplace(hwmon-&gt;type, '-', '_');
        </tt><tt><br>
        </tt><tt>-    hwmon-&gt;device =
          hwmon_device_register_with_info(&amp;tz-&gt;device,
          hwmon-&gt;type,
        </tt><tt><br>
        </tt><tt>+    hwmon-&gt;device =
          hwmon_device_register_with_info(tz-&gt;device.parent,
          hwmon-&gt;type,
        </tt><tt><br>
        </tt><tt>                              hwmon, NULL, NULL);
        </tt><tt><br>
        </tt><tt>      if (IS_ERR(hwmon-&gt;device)) {
        </tt><tt><br>
        </tt><tt>          result = PTR_ERR(hwmon-&gt;device);
        </tt><tt><br>
        </tt>
        <tt><br>
        </tt></blockquote>
      <tt><br>
      </tt><tt>It is not clear to me that this is any better. What is
        the parent device in this case? Can you give an example of what
        breaks in the hierarchy?
      </tt><tt><br>
      </tt>
      <tt><br>
      </tt><tt>Given how close we are to to 4.19, I'd rather we revert
        f6b6b52ef7a54160 if there are userspace visible regressions.
      </tt><tt><br>
      </tt>
      <tt><br>
      </tt></blockquote>
    <tt><br>
    </tt><tt>Initially, I considered your patch to be correct and went
      to look at the processor in the hwmon core. Then I created the v1
      patch. </tt><tt><br>
    </tt><tt>After patch v1, I noticed that it is necessary to check for
      cases where the device has parent and if there is no parent. </tt><tt><br>
    </tt><tt>However, when looking at function
      hwmon_device_register_with_info() and its header, I see that the
      device parameter passed in </tt><tt><br>
    </tt><tt>must be the parent device ("* @dev: the parent device").
      Therefore, I think it's best to pass a parent device parameter to
      this function. </tt><tt><br>
    </tt><tt>So, I decided to create this v2 patch.</tt><tt><br>
    </tt><tt><br>
    </tt><tt><br>
    </tt><tt>Regards,
    </tt><tt><br>
    </tt><tt>Dong/Jinso
    </tt><tt><br>
    </tt><tt>
    </tt><tt><br>
    </tt><tt><br>
    </tt>
  </body>
</html>

--------------DC6A78B686B44976BC8942FA--
