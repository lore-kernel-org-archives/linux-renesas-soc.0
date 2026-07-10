Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E90B3F44C4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 12:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686392; cv=none; b=YwSCGNWIOL12suxnRKS9KyCek4cHfMWuXVXLLgVwbmlFIll+zK+/TI59fsnnCVE22JDmu+ziL4KSHUqVxh5KT2mHTUu/M3hri0c7DaXpCpwd/86UO3C/SS9KZ2xfGwDbY+ZVlBO+iHcp4GHbsDKMu7aQhezR/O48tv12WA7Dl6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686392; c=relaxed/simple;
	bh=jK7AhlYaSjhImbGoh76aRUNAyBv1HGbqZ5DYn5xkz/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgfEZPpYznaIo2uLjBfvpwp3Xmsll9/dPP0EF2aKEZ4xTQRV8V1Ij3Y3x963uwPC8dJK/wi7+nYxmeYjUYJmkYZL6+Zp1uX3xQo60W8tlszUjUDe5CMoYXZ2mv5nUyc8I5bkp8RBbwBziYiZ2SgMkxQZH2REC7UFWqS3tCQDg+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wiAJF-0003Ek-5N; Fri, 10 Jul 2026 14:26:25 +0200
Message-ID: <fc504e89-11cb-47f8-ba25-19577b0811c5@pengutronix.de>
Date: Fri, 10 Jul 2026 14:26:23 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: v4l2-common: Add v4l2_fill_pixfmt_aligned()
 helper
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
 <20260708161406.396183-3-tommaso.merciai.xr@bp.renesas.com>
 <ak9pPzjABetdgUiq@zed> <210aa2ee-8931-4dd2-a51f-eeb0c205d647@pengutronix.de>
 <alC6DDFZ23q5h33W@zed> <00b18307-f982-44bc-bbab-4a640753d8fc@pengutronix.de>
 <alDgNTv9M2_aVV7U@zed>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <alDgNTv9M2_aVV7U@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 7/10/26 2:15 PM, Jacopo Mondi wrote:
> Hi Sven
>
> On Fri, Jul 10, 2026 at 01:54:06PM +0200, Sven Püschel wrote:
>> Hi Jacopo,
>>
>> On 7/10/26 11:38 AM, Jacopo Mondi wrote:
>>>> This is due to the fact, that while we have a hdiv of 2 we also interleave
>>>> the cb and cr parts in a single plane, which results in the stride being the
>>>> same number of bytes as for the y plane (and vdiv isn't relevant for the
>>>> stride).
>>>>
>>>> Therefore the stride scaling also respects the bits per plane (bpp) value to
>>>> determine the scaling.
>>>>
>>>> @Tommaso : While the sentence looks ok, the NV12 example is misguided. The
>>> I guess the usage of NV12 was as example of a "formats that store
>>> multiple component planes in a single memory"
>>>
>>> NV24/42 works the same, but being 444 it needs the chroma plane stride to
>>> be a multiple of the fist plane stride and might prove as a better
>>> example ?
>>>
>> My potential concern is that NV as an example misguides the reader into one
>> of the following:
>>
>> - It's only for formats which interleave cb/cr into one plane (whereas
>> YUV420 also gets scaled)
>> - NV24 in the example being though of including the NV24M variant (whereas
>> latter won't be affected)
> M variants are not supported by the single-planar APIs
> https://docs.kernel.org/userspace-api/media/v4l/pixfmt-yuv-planar.html
>
> Some planar formats allow planes to be placed in independent memory
> locations. They are identified by an ‘M’ suffix in their name (such as
> in V4L2_PIX_FMT_NV12M). Those formats are intended to be used only in
> drivers and applications that support the multi-planar API,
>
> And here we're dealing with single-planar API only if I'm not mistaken

Oh, sorry. Assumed that the added description of both functions would be 
similar/identical, which isn't the case.

Given this, I'm fine with the wording and agree to just change the 
example to smth. else than NV12.

Sincerely
     Sven


