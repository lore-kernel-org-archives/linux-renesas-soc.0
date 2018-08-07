Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50582 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732619AbeHGRUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Aug 2018 13:20:43 -0400
Subject: Re: [Qemu-devel] [PATCH v3 1/4] vfio/platform: Make the vfio-platform
 device non-abstract
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20180725143413.9728-1-geert+renesas@glider.be>
 <20180725143413.9728-2-geert+renesas@glider.be>
 <276c2cab-659f-ad1a-d3a3-0e0df9a439c9@redhat.com>
 <CAMuHMdUuWT+-7wGg2SYTvtQV0Cy64N5GYTB0b-3gXPS3KLoO2w@mail.gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <damm+renesas@opensource.se>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        qemu-arm <qemu-arm@nongnu.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <303a110d-7cb6-9003-e225-7f9d87d78811@redhat.com>
Date: Tue, 7 Aug 2018 17:05:54 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUuWT+-7wGg2SYTvtQV0Cy64N5GYTB0b-3gXPS3KLoO2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 08/07/2018 05:00 PM, Geert Uytterhoeven wrote:
> Hi Eric,
> 
> On Tue, Aug 7, 2018 at 4:18 PM Auger Eric <eric.auger@redhat.com> wrote:
>> On 07/25/2018 04:34 PM, Geert Uytterhoeven wrote:
>>> From: Auger Eric <eric.auger@redhat.com>
>>>
>>> Up to now the vfio-platform device has been abstract and could not be
>>> instantiated.  The integration of a new vfio platform device required
>>> creating a dummy derived device which only set the compatible string.
>>>
>>> Following the few vfio-platform device integrations we have seen the
>>> actual requested adaptation happens on device tree node creation
>>> (sysbus-fdt).
>>>
>>> Hence remove the abstract setting, and read the list of compatible
>>> values from sysfs if not set by a derived device.
>>>
>>> Update the amd-xgbe and calxeda-xgmac drivers to fill in the number of
>>> compatible values, as there can now be more than one.
>>>
>>> Note that sysbus-fdt does not support the instantiation of the
>>> vfio-platform device yet.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> [geert: Rebase, set user_creatable=true, use compatible values in sysfs
>>>       instead of user-supplied manufacturer/model options, reword]
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>> v3:
>>>   - Read all compatible values from sysfs instead of using user-supplied
>>>     manufacturer and model options,
>>>   - Reword patch description,
>>>   - Drop RFC state,
>>>
>>> v2:
>>>   - No changes,
>>>
>>> v1:
>>>   - Rebase, Set user_creatable=true,
>>>
>>> v0:
>>>   - Original version from Eric.
> 
>>> --- a/hw/vfio/platform.c
>>> +++ b/hw/vfio/platform.c
>>> @@ -655,6 +655,25 @@ static void vfio_platform_realize(DeviceState *dev, Error **errp)
>>>          goto out;
>>>      }
>>>
>>> +    if (!vdev->compat) {
>>> +        gchar *contents;
>>> +        gsize length;
>>> +        char *tmp;
>>> +
>>> +        tmp = g_strdup_printf("%s/of_node/compatible", vbasedev->sysfsdev);
>>> +        if (!g_file_get_contents(tmp, &contents, &length, NULL)) {
>>> +            error_report("failed to load \"%s\"", tmp);
>>> +            exit(1);
>> You should set errp instead so that the error gets properly propagated.
> 
> Thanks, will do.
> 
>>> --- a/include/hw/vfio/vfio-platform.h
>>> +++ b/include/hw/vfio/vfio-platform.h
>>> @@ -54,7 +54,8 @@ typedef struct VFIOPlatformDevice {
>>>      QLIST_HEAD(, VFIOINTp) intp_list; /* list of IRQs */
>>>      /* queue of pending IRQs */
>>>      QSIMPLEQ_HEAD(pending_intp_queue, VFIOINTp) pending_intp_queue;
>>> -    char *compat; /* compatibility string */
>>> +    char *compat; /* DT compatible values, separated by NUL */
>> by NULL characters?
> 
> "NUL" is the character ('\0'), "NULL" is the pointer.
Ah OK ;-)

Thanks

Eric
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
