Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286D13101D8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 11:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684463; cv=none; b=QElc6HB8zekfFUaNRcNQKTl+yRStNhxE8nPyZRrHYu3l/Rwn4wSfJrQtUydThpVmCAkodaWNQFsWfogbvnITxSPuj5spw1V/IrnLqkyv5LwUHHplU/o9YbtML2Sqq2SwhpHLBc+Ns2BgwNr3QAFwE5nmQL330lO8iiTy70r+/SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684463; c=relaxed/simple;
	bh=GCWVyBroHWdqwDdI3fyaj+P0cYi9W1+dTfPtYlS5hoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fk4v5Xpi5AKugg2oqNBQrIOK2FG229EklEAVzQIuKfG8KuCbz/CB3qzcMhy7jOk7g+SJiZF+ICGpP78tabl2nlc8XiLn4pAjqDmBtUotAlXAklUZgNWhtU4kE9oqbUeXsCOWq2VzztkNfykr7CEoC1Zd9lSF1CbaTGqC5WqptkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wi9o1-0001Ng-OC; Fri, 10 Jul 2026 13:54:09 +0200
Message-ID: <00b18307-f982-44bc-bbab-4a640753d8fc@pengutronix.de>
Date: Fri, 10 Jul 2026 13:54:06 +0200
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
 <alC6DDFZ23q5h33W@zed>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <alC6DDFZ23q5h33W@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 7/10/26 11:38 AM, Jacopo Mondi wrote:
>> This is due to the fact, that while we have a hdiv of 2 we also interleave
>> the cb and cr parts in a single plane, which results in the stride being the
>> same number of bytes as for the y plane (and vdiv isn't relevant for the
>> stride).
>>
>> Therefore the stride scaling also respects the bits per plane (bpp) value to
>> determine the scaling.
>>
>> @Tommaso : While the sentence looks ok, the NV12 example is misguided. The
> I guess the usage of NV12 was as example of a "formats that store
> multiple component planes in a single memory"
>
> NV24/42 works the same, but being 444 it needs the chroma plane stride to
> be a multiple of the fist plane stride and might prove as a better
> example ?
>
My potential concern is that NV as an example misguides the reader into 
one of the following:

- It's only for formats which interleave cb/cr into one plane (whereas 
YUV420 also gets scaled)
- NV24 in the example being though of including the NV24M variant 
(whereas latter won't be affected)

Maybe smth. like YUV420 but not YUV420M is a better example (could also 
be NV24 but not NV24M)?

Sincerely
     Sven

