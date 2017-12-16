Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37930 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752746AbdLPQqp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Dec 2017 11:46:45 -0500
Subject: Re: [PATCH 0/4] kms++util: Provide validation helpers
To: Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
 <6977594a-ebd8-63b3-b470-b58fa663ccb6@ti.com>
Reply-To: kieran.bingham@ideasonboard.com
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <95e554e2-6a69-bb8c-a093-c0a7d832ca42@ideasonboard.com>
Date: Sat, 16 Dec 2017 16:46:41 +0000
MIME-Version: 1.0
In-Reply-To: <6977594a-ebd8-63b3-b470-b58fa663ccb6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 15/12/17 14:10, Tomi Valkeinen wrote:
> On 14/12/17 01:10, Kieran Bingham wrote:
>> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
>>
>> Our kms-tests test suite for verifying the R-Car DU is based on kmsxx.
>>
>> We are implementing a 'loop-back' validator, by providing an HDMI cable from
>> the display output directly into the HDMI receiver on the same development
>> board.
>>
>> By using the existing VideoStreamer and pyvid objects, we can capture the output
>> and compare to provide automated display validation.
>>
>> As an effort to commence this process, this series implements a basic frame
>> buffer comparison, which expects identical frame sizes to operate.
>>
>> This could be could be expanded upon later to provide a more detailed
>> comparison at the pixel level later, but this serves as an initial starting
>> point to quickly verify if the data captured matches the data that we expected.
>>
>> Kieran Bingham (4):
>>    videodevice: Fix minor spacing
>>    py: pyvid: Provide stream_off binding
> 
> Thanks, I've picked up the first two patches.
That's great.

Thanks again.

--
Kieran
