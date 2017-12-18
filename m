Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:25427 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752415AbdLRLtq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 06:49:46 -0500
Subject: Re: [PATCH 3/4] kms++util: Add verification module
To: <kieran.bingham@ideasonboard.com>,
        <linux-renesas-soc@vger.kernel.org>
CC: <laurent.pinchart@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
 <2804f59b2ecafc22abb57428f38a9b2d267ff0b7.1513206331.git-series.kieran.bingham@ideasonboard.com>
 <0827e08d-3c42-d878-99da-ed7b77776031@ti.com>
 <b8d5db70-0193-49b7-773b-dcebd9c8cb20@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <8ba0f8c1-14a5-3935-b928-d172ec088cea@ti.com>
Date: Mon, 18 Dec 2017 13:49:40 +0200
MIME-Version: 1.0
In-Reply-To: <b8d5db70-0193-49b7-773b-dcebd9c8cb20@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 16/12/17 18:13, Kieran Bingham wrote:

>>> +void save_raw_frame(IFramebuffer& fb, const char *filename)
>>> +{
>>> +    unique_ptr<ofstream> os;
>>> +    os = unique_ptr<ofstream>(new ofstream(filename, ofstream::binary));
>>> +
>>> +    for (unsigned i = 0; i < fb.num_planes(); ++i)
>>> +        os->write((char*)fb.map(i), fb.size(i));
>>> +}
>>
>> You don't need any of that unique_ptr stuff here. I needed it as the code needed
>> to handle the case where we don't save, i.e. os = null.
> 
> Ah OK - I thought it was providing the hook up to automatically close the stream
> at the end of the function.
> 
> I guess an explicit close would be just as clean :)

You don't need an explicit close. The ofstream instance will be 
destructed automatically, and thus the stream will be closed.

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. 
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
