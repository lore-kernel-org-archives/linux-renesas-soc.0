Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:45005 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757452AbcLTNIa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Dec 2016 08:08:30 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Tue, 20 Dec 2016 14:01:46 +0100
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 04/13] drm: Add data mirror bus flag
In-Reply-To: <1945420.2ppkyQgY5N@avalon>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1479526093-7014-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1945420.2ppkyQgY5N@avalon>
Message-ID: <127f384d92291ce5d9447b763340432c@agner.ch>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On 2016-12-18 21:31, Laurent Pinchart wrote:
> Hi Stefan and Thierry,
> 
> As the author and suggester of the other bus flags, could you please review 
> this patch ?

It looks to me like an appropriate use case for the flag. One remark
below:

> 
> On Saturday 19 Nov 2016 05:28:04 Laurent Pinchart wrote:
>> The flag indicates that data is mirrored on the bus. The exact meaning
>> is bus-type dependent. For LVDS buses it indicates that the seven data
>> bits that transmitted in a clock pulse are sent in slots 6 to 0 order.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> ---
>>  include/drm/drm_connector.h | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index ac9d7d8e0e43..5c1dda236760 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -159,6 +159,8 @@ struct drm_display_info {
>>  #define DRM_BUS_FLAG_PIXDATA_POSEDGE	(1<<2)
>>  /* drive data on neg. edge */
>>  #define DRM_BUS_FLAG_PIXDATA_NEGEDGE	(1<<3)
>> +/* data is mirrored on the bus */
>> +#define DRM_BUS_FLAG_DATA_MIRROR	(1<<4)

Sounds like a bit endianness issue. I am wondering is if "mirror" is a
good term. Can we name the possible orderings? How about:

DRM_BUS_FLAG_DATA_MSB_TO_LSB
DRM_BUS_FLAG_DATA_LSB_TO_MSB 

--
Stefan

>>
>>  	/**
>>  	 * @bus_flags: Additional information (like pixel signal polarity) for
