Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53002 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750939AbcIVD66 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Sep 2016 23:58:58 -0400
Subject: Re: [PATCH v3 1/6] mmc: add define for R1 response without CRC
To: Wolfram Sang <wsa@the-dreams.de>
References: <20160919205750.4766-1-wsa+renesas@sang-engineering.com>
 <CGME20160919205932epcas1p3cec11c9dbe2589f7d50fee5932797933@epcas1p3.samsung.com>
 <20160919205750.4766-2-wsa+renesas@sang-engineering.com>
 <ee4fe6b6-14bd-a0a5-9d6c-30c314ed83c3@samsung.com>
 <20160921060033.GD1484@katana>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Dirk Behme <dirk.behme@gmail.com>
From: Jaehoon Chung <jh80.chung@samsung.com>
Message-id: <47066497-0381-3c05-523d-896dc16b5115@samsung.com>
Date: Thu, 22 Sep 2016 12:58:54 +0900
MIME-version: 1.0
In-reply-to: <20160921060033.GD1484@katana>
Content-type: text/plain; charset=windows-1252
Content-transfer-encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/21/2016 03:00 PM, Wolfram Sang wrote:
> On Tue, Sep 20, 2016 at 06:25:37PM +0900, Jaehoon Chung wrote:
>> Hi Wolfram,
>>
>> On 09/20/2016 05:57 AM, Wolfram Sang wrote:
>>> The core uses it for polling. Give drivers a proper define handle this
>>> case like for other response types.
>>>
>>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>> ---
>>>  include/linux/mmc/core.h | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/include/linux/mmc/core.h b/include/linux/mmc/core.h
>>> index b01e77de1a74de..4caee099b63a28 100644
>>> --- a/include/linux/mmc/core.h
>>> +++ b/include/linux/mmc/core.h
>>> @@ -55,6 +55,9 @@ struct mmc_command {
>>>  #define MMC_RSP_R6	(MMC_RSP_PRESENT|MMC_RSP_CRC|MMC_RSP_OPCODE)
>>>  #define MMC_RSP_R7	(MMC_RSP_PRESENT|MMC_RSP_CRC|MMC_RSP_OPCODE)
>>>  
>>> +/* Can be used by core to poll after switch to MMC HS mode */
>>> +#define MMC_RSP_R1_NO_CRC	(MMC_RSP_PRESENT|MMC_RSP_OPCODE)
>>
>> MMC_RSP_RQ_NO_CRC is described at Specification?
> 
> Yes. JEDEC eMMC Spec v5.1, chapter 6.6.2, in the note:
> 
> "NOTE While the actual timing change is done, the behavior of any
> command sent (like CMD13) cannot be guaranteed due to the asynchronous
> operation. Therefore it is not recommended to use CMD13 to check the
> busy completion of the timing change indication. In case CMD13 is used
> the host must ignore CRC errors, if appear."

Thanks for noticing this. I read the spec again.

Best Regards,
Jaehoon Chung

> 
> And the MMC core does that. In mmc_ops.c:
> 
> 70         if (ignore_crc)
> 71                 cmd.flags &= ~MMC_RSP_CRC;
> 
> And ignore_crc is used in mmc.c (last 'true' parameter):
> 
> 1023         err = __mmc_switch(card, EXT_CSD_CMD_SET_NORMAL,
> 1024                            EXT_CSD_HS_TIMING, EXT_CSD_TIMING_HS,
> 1025                            card->ext_csd.generic_cmd6_time,
> 1026                            true, false, true);
> 
> This is why I put the comment above the define.
> 
