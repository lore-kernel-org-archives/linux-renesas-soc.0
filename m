Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819753;
	b=TrH/3Q8EwCL+nGMNZLY5weFGW1DpNXjcIyw7lHL32vBEGfa+9ANEoFNE7YrMdm9vEcOt
	 Ds0l5bPJ39IzQDOg4sN3XYj6e64InQXeuIhOjAoiuIVIGOuMf4/oDvknjSVgW4OeCtLQv
	 8zb06L9T4xmjrWMzBxQK9YiDWFcU//Iz7653WvQpItIjzWDbJvfvYZnqfZRL2abqR0tam
	 UOmqBDJXJXPGA0JGxQRX/6RvkJNVyxcrm1jDHMNUmlbhX1/gGBtodhvDqP6oBXwtKbGEZ
	 izSoUbyI0VeMXrw1lyQi8ZCeE0MLEnKI5aYoUOAq4Uq+n+j7GpP9jLh0Yg6Y4Z8nIHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819753;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=X09cmhideRzP2/0pXNcm8+NawPZ+G5eZLsTNigbgmV8=;
	b=x201UcwZThEZ2BajsdkauBmABbpR8MkB0+KhjXSP0G3u4rh9JqqABTQmNLyZ5d+wg0kT
	 in4CRuY444pIhdSNVvyOvkg4OQ+PUlVDtQGTKXjsB6K7b0LGL3NDTQn2IRGrqhNHEmGAv
	 PhdYMATotZLxUbOLaOXBJw1JcatN3CqTTMu47P2Zpvo+xqK20o9o7EkyeFW9/SpEBBtvT
	 TgHkIKzEDP7UMGe3ZjbJkLKue1hjEii2hUr3wHe7rCCRg8WYr4pZjUfvGYoQAd1IyJVY4
	 1m0ceAAGusnmBsGgeuV4/J4IsdYSPn9HzRv3tptTd9f/Nh3n9//+5FddXaPqksIc58Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=hjxCLNOe;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D69A606A31B;
	Wed,  4 Nov 2026 19:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D69A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=hjxCLNOe
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5EC9C23;
	Wed,  4 Nov 2026 20:13:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793819609;
	bh=HBg4aRNd/R3i+9umRwQlYorXdpv2ec8lmZZoaw1A1Tk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hjxCLNOerzI938rBRdpl9ZtbSOB4Og9M7qEmBQztYDP6w0dr1QLTV0ANT27Dsvx96
	 aEgyVb5sQxuQE3Nkw8aThC/KbG1wHCSf+aSjdH1St919f8FhXAS8tUAIAK+RvAUnOp
	 ij0305Iw9gj+cAxHfy/xBFBJhO3QSjssnVJUSgxs=
Message-ID: <8eec215a-77a8-4e5d-9290-70ec58c1c329@ideasonboard.com>
Date: Wed, 4 Nov 2026 19:15:44 +0000
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Introduce v4l2-isp reset buffers
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Keke Li <keke.li@amlogic.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20261104-v4l2-isp-resume-v1-0-06aeb8cf2940@ideasonboard.com>
 <20261104142302.GK1959885@ragnatech.se>
 <6a86cb84-c4b4-44b3-9977-12ac1dc8505c@ideasonboard.com>
 <20261104170645.GM1959885@ragnatech.se>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20261104170645.GM1959885@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Niklas

On 04/11/2026 17:06, Niklas Söderlund wrote:
> Hi Dan,
> 
> On 2026-11-04 16:24:01 +0000, Dan Scally wrote:
>> Hi Niklas - thanks for commenting
>>
>> On 04/11/2026 14:23, Niklas Söderlund wrote:
>>> Hi Daniel,
>>>
>>> On 2026-11-04 12:28:15 +0000, Daniel Scally wrote:
>>>> The V4L2 generic ISP parameters buffers described in
>>>> Documentation/driver-api/media/v4l2-isp.rst has a problem in that if
>>>> a driver using the parameters format is running a stream and the
>>>> device is suspended to RAM and later resumed, userspace will not tend
>>>> to reconfigure it with _all_ of the possible parameter blocks. The
>>>> format allows only a subset to be populated into the buffer queued to
>>>> the driver and this is the common practice in libcamera. The effect
>>>> will be that a resumed device will have lost any configuration that
>>>> tends to be sent only a single time at the start of a stream, for
>>>> example lens shading table settings.
>>>>
>>>> This series performs some preliminary cleanup and then adds the "reset
>>>> buffer" concept to v4l2-isp. This is a mechanism through which user
>>>> space can flag a struct v4l2_isp_block_header.flags as needing to be
>>>> reapplied on device reset, such that the v4l2-isp framework will store
>>>> that block into a buffer allocated for the purpose when it validates
>>>> the block.
>>>>
>>>> The last patch in the series updates the rkisp1 driver to use the
>>>> v4l2-isp reset buffer to reapply that saved configuration on resume.
>>>>
>>>> An alternative approach might simply be to store the "last seen" copy
>>>> of any block in the reset buffer - this would be a simple change.
>>>> That implies a lot more processing on the majority of frames, as we'll
>>>> then always copy at least something, but it reduces the risk of losing
>>>> a setting. That amount of processing each frame seems very undesirable
>>>> to me though, particularly given the scene will presumably have changed
>>>> after resume and so the settings like AWB gains that are applied for
>>>> most frames are probably out of date anyway. On the other hand we may
>>>> end up flagging a lot of blocks, as there's parameters that might be
>>>> changed mid-stream (like gamma) but would not be so regularly changed
>>>> that we could just rely on them being sent naturally on resume, so a
>>>> third approach might be to invert the meaning of the flag and store
>>>> any block that _isn't_ flagged as _not_ needing to be reapplied.
>>>
>>> Is there any reason not saving and restoring all relevant ISP registers
>>> directly in the suspend() / resume () callbacks? AFIK this is what most
>>> drivers do here and it's not clear to me why this would not work here?
>>
>> I don't see any reason that would not work, and maybe I overthought this
>> indeed. This method does still seem to have some advantages to me though; it
>> means we can easily reuse the existing function in the driver that applies
>> the parameters to the hardware, which should make adding suspend() and
>> resume() support for a driver that uses the extensible parameters much
>> simpler. If we were to read the settings from the ISP registers and store
>> them in suspend() instead of doing it this way I think I'd still want to
>> re-use the normal "write-params-buffer-to-hardware" function (for example
>> rkisp1_ext_params_config() in the rkisp1 driver) to avoid the risk of ending
>> up with differences between how the parameters were applied on resume() and
>> on the normal handling of a parameters buffer from userspace, so I think
>> that we would end up populating a struct v4l2_isp_params_buffer that was
>> stored in the device's driver_data struct anyway - the difference would be
>> that we'd have to build it in suspend() for each ISP driver instead of
>> having the core handle it in the course of normal operation. I could knock
>> up an example for the rkisp1 of creating that buffer in suspend() to see how
>> it looks perhaps?
> 
> I think what made me comment on this is the involvement of user-space in
> how suspend/resume will act. Normally I assume the kernel will deal with
> it all, and after resume it will restore (to the extent possible) the
> hardware state as it where at suspend time. I'm sure this approach exist
> elsewhere in the kernel, I'm just not aware of it.
> 
> My worry is that suspend/resume will work as expected for libcamera
> users, but then somebody does something else and expect the kernel to
> handle it correctly like it do for other types of devices.

Ah; yes I understand. The motivation with the flag was just to avoid dealing with _every_ block, 
because on most frames, all that comes in are settings that change rapidly like the white balance 
gains. It doesn't seem worthwhile even handling those because the scene will probably have changed 
when the device resumes anyway so whatever they were set to originally is unlikely to still be 
appropriate anyway. In the cover letter I mentioned the alternative to just record the "last seen" 
copy of every block and reapply that, but that implies a performance hit that I think is undesirable 
given it's probably a waste of time to reapply those kinds of settings.

Perhaps instead of the flag coming from userspace we could add a flags field to struct 
v4l2_isp_params_block_type_info, an array of which is already passed to the v4l2-isp core by each 
driver - then the driver can decide whether or not a block is flagged as needing to be tracked by 
the core and reapplied on resume, and the whole thing is completely transparent to userspace.


> 
> Maybe I'm being too causations. Putting the user-space involvement to
> the side for a moment, having v4l2-isp provide helpers to apply buffers
> at resume time to save on boiler plate code in drivers is of course a
> good idea.
> 
> IIRC this is what is done for V4L2 controls already. The V4L2 core sets
> all controls at resume time so the drivers don't need to deal with it
> directly in their handlers and the existing set/get callbacks are used.
> 
> Maybe we need a get params callback to v4l2-isp? And have the core do it
> the same way here? I guess this is one fun area where we mixing V4L2
> classic controls, controls in buffers (v4l2-isp) and per frame controls
> into yet another control abstraction, so maybe not go there ;-)

Haha well I did wonder if the block handlers could also be added to struct 
v4l2_isp_params_block_type_info and a function from v4l2-isp core do the walking of the blocks and 
calling of the handlers...I haven't looked into it too seriously yet, but maybe it's worthwhile.

> 
> I'm happy to hear what others think of this. I do see the value of what
> you are trying todo, I'm just a tad worried about involving user-space.

I understand - thank you for raising it!

Dan

> 
>>
>> The "reset buffer" idea also means that if we extend the parameters buffer
>> for an ISP with more blocks in the future there's no extra work to do in the
>> suspend() and resume() callbacks for them - as long as userspace flagged the
>> new block then they would just be reapplied "for free".
> 
> I understand and this would be appealing.
> 
>>
>> Thanks
>> Dan
>>
>>>
>>>>
>>>> I'm open to opinions on how best to set the balance!
>>>>
>>>> Please note that the changes for the C3 and Dreamchip are only compile
>>>> tested.
>>>>
>>>> Thanks
>>>> Dan
>>>>
>>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>>> ---
>>>> Daniel Scally (7):
>>>>         media: rppx1: Drop max_size param from rppx1_params()
>>>>         media: v4l2-isp: Hold v4l2-isp data in central struct
>>>>         media: v4l2-isp: Update users to initialise and validate new struct
>>>>         media: v4l2-isp: Use centrally-held data in framework
>>>>         media: v4l2-isp: Add v4l2_isp_params_for_each_block()
>>>>         media: v4l2-isp: Introduce "reset buffer" concept
>>>>         media: rkisp1: Re-apply v4l2-isp reset buffer on resume
>>>>
>>>>    Documentation/userspace-api/media/v4l/v4l2-isp.rst |  19 ++++
>>>>    .../media/platform/amlogic/c3/isp/c3-isp-common.h  |   2 +
>>>>    .../media/platform/amlogic/c3/isp/c3-isp-params.c  |  28 +++--
>>>>    .../media/platform/arm/mali-c55/mali-c55-common.h  |   1 +
>>>>    .../media/platform/arm/mali-c55/mali-c55-params.c  |  28 ++---
>>>>    .../media/platform/dreamchip/rppx1/rpp_params.c    |  30 +++--
>>>>    drivers/media/platform/dreamchip/rppx1/rppx1.c     |   8 ++
>>>>    drivers/media/platform/dreamchip/rppx1/rppx1.h     |   5 +
>>>>    drivers/media/platform/renesas/rcar-isp/core-io.c  |   3 +-
>>>>    .../media/platform/rockchip/rkisp1/rkisp1-common.h |   3 +
>>>>    .../media/platform/rockchip/rkisp1/rkisp1-params.c |  61 ++++++----
>>>>    drivers/media/v4l2-core/v4l2-isp.c                 | 126 +++++++++++++++++++--
>>>>    include/media/rppx1.h                              |   2 +-
>>>>    include/media/v4l2-isp.h                           | 109 ++++++++++++++----
>>>>    include/uapi/linux/media/v4l2-isp.h                |   1 +
>>>>    15 files changed, 331 insertions(+), 95 deletions(-)
>>>> ---
>>>> base-commit: 00178eda305a332f302882849ff7374d4169be8b
>>>> change-id: 20261030-v4l2-isp-resume-41fad731df28
>>>> prerequisite-change-id: 20261028-rkisp1-suspend-and-resume-7d4f388a9a61:v1
>>>> prerequisite-patch-id: 8f6b499ef7898229c5b02e987822dd676a0cfd74
>>>> prerequisite-patch-id: 56d0852983c6f46537c03ca3bec71e0ce4046431
>>>> prerequisite-patch-id: 0b9edd21d24a25c620792dfa692d91346ceccdde
>>>> prerequisite-patch-id: 3b9425028cd62b60b3dc3dbd2fc3b5a8912a1fb4
>>>> prerequisite-patch-id: 771f986e2754383e7b5a920b25bf1609dc96f0b4
>>>> prerequisite-patch-id: 79c95d6375d662a4f75cccd8650b3fab05e4e66c
>>>> prerequisite-patch-id: e2ff2463db4934e707afbf0a239270d26dbf8189
>>>> prerequisite-patch-id: 5a923b7606f7cc60fd6b75be2d73231470043bcb
>>>> prerequisite-patch-id: fb80748a1a24316cdd77481b60936f716fd0aa71
>>>> prerequisite-patch-id: 1450f7d1f4b1a41e7ce65ea6d2fbd450d3a198ad
>>>> prerequisite-patch-id: d1d2ba9927536b110f7fbc0c68698d08afb74c27
>>>> prerequisite-patch-id: c2ae6f91cb9662307f90070523945ee03a79c4c3
>>>> prerequisite-patch-id: 87b425bde44fe889367a93302629dc011a3ec88a
>>>> prerequisite-patch-id: 25e4c9ee767dc61406adcf1e1463796a79832795
>>>> prerequisite-patch-id: 82388f762700dbcf39fdc43e6ba56c1feb55733a
>>>> prerequisite-patch-id: a4ad2fb2c7f8659c6d9bdcd9718a7ee69f124838
>>>>
>>>> Best regards,
>>>> -- 
>>>> Daniel Scally <dan.scally@ideasonboard.com>
>>>>
>>>
>>
> 

