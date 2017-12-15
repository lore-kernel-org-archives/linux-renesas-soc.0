Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:46166 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932215AbdLOOKz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 09:10:55 -0500
Subject: Re: [PATCH 0/4] kms++util: Provide validation helpers
To: Kieran Bingham <kbingham@kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
CC: <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <6977594a-ebd8-63b3-b470-b58fa663ccb6@ti.com>
Date: Fri, 15 Dec 2017 16:10:49 +0200
MIME-Version: 1.0
In-Reply-To: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 14/12/17 01:10, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Our kms-tests test suite for verifying the R-Car DU is based on kmsxx.
> 
> We are implementing a 'loop-back' validator, by providing an HDMI cable from
> the display output directly into the HDMI receiver on the same development
> board.
> 
> By using the existing VideoStreamer and pyvid objects, we can capture the output
> and compare to provide automated display validation.
> 
> As an effort to commence this process, this series implements a basic frame
> buffer comparison, which expects identical frame sizes to operate.
> 
> This could be could be expanded upon later to provide a more detailed
> comparison at the pixel level later, but this serves as an initial starting
> point to quickly verify if the data captured matches the data that we expected.
> 
> Kieran Bingham (4):
>    videodevice: Fix minor spacing
>    py: pyvid: Provide stream_off binding

Thanks, I've picked up the first two patches.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. 
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
