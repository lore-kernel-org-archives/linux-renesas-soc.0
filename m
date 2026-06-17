Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7153C7E0B;
	Wed, 17 Jun 2026 09:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781688831; cv=none; b=LSl3BXu2bGAg9UQkOR07kvcDbfk2jCgGqNzFyHM+5AXkFAFVLAc+5cKieH7Bt9bLBgly5CBeBRWphb6jFEXOOk24y9bTaN8ySxdbMim3K7VembnMCtyaVRVcBIvKHvocQBw9VOy3LRCkbIg2Xwqz5MyQyEtaGpc2gfWCl/ziiU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781688831; c=relaxed/simple;
	bh=kTNwExARmY9+uDtGRyDzeskIKoRIYE9q0kaapf76K2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=emDWawBOD7BEpNvFkP0DFUo65XglVUh2faWbRu/uLITc3+qLbSTCUN2xS7MQmMf/nl2q0Qt7yOfABQ1/AxWizxVJyN+RdhaIlfFCrKZKsi4N6F6Xs4uG0Wfdh3w/KUy+JXp+0u5kbpsGfqaPIqUvSZF2rV/vtYSztBFFQbUOwLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MT9fF264; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MT9fF264"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7F8F2F8;
	Wed, 17 Jun 2026 11:33:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781688792;
	bh=kTNwExARmY9+uDtGRyDzeskIKoRIYE9q0kaapf76K2s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MT9fF264iL+j5wfqhjK1U6EZfUxF9Ku/MoGYt9KwMsx5A35WXF2owhaHRnAV8ZwF5
	 JmwbgVwFqFqAncXO0GwwIw4WCw7t2isKZVVwOjrGfZcbw3vnijlOZV4uCFfzvFYizf
	 pFSFQUHmmD18bSw8CB4Bg6z1j+09dNtx3Cmj+ZbI=
Message-ID: <6b409b1d-2b18-4d72-bdfb-18d2d0f536c6@ideasonboard.com>
Date: Wed, 17 Jun 2026 12:33:42 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] media: rcar-csi2: Move
 {enable|disable}_streams() calls
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
 <20260311-rcar-streams-v5-3-3e6c957d7567@ideasonboard.com>
 <20260318205435.GG716464@killaraus.ideasonboard.com>
 <e0ad4d15-2cf9-45a5-9312-fac297119ad4@ideasonboard.com>
 <20260616123419.GD2984510@killaraus.ideasonboard.com>
 <20260616140420.GA1662668@fsdn.se>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260616140420.GA1662668@fsdn.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 16/06/2026 17:04, Niklas Söderlund wrote:

>>>> rcsi2_irq_thread() also calls rcsi2_stop(), followed by rcsi2_start().
>>>> This is to handle errors reported by the AFIFO_OF, ERRSOTHS and
>>>> ERRSOTSYNCHS interrupts. If the source isn't restarted, such an attempt
>>>> to recover from errors will likely fail. On the other hand, restarting
>>>> the source will likely not lead to great results either.
>>>
>>> Indeed. I think for single-stream use cases the behavior should still be
>>> the same, but for multi-stream use, any enabled stream will keep the
>>> csi2 enabled.
>>>
>>> This kind of error handling sounds a bit fragile. If a restart helps,
>>> don't we need to restart the whole pipeline, not just from csi2-rx
>>> upwards? Or is it guaranteed that the ISP/CS and VIN will continue working?
>>
>> My feeling is that these kind of errors would be best handled in
>> userspace.
> 
> I agree this should be handled in user-space. But since we have (or at
> least did not when this was added) no way to signal to user-space that
> an error have occurred and that action is needed this at least solved
> the error reported by the user.
> 
> If we think this is should be dropped and somehow signal user-space that
> action is needed that is OK for me. But then please remove all of it.
> 
>>
>>> Did this work earlier with the custom VC based routing?
>>
>> That I don't know.
> 
> It did. At least for the only way I had to create the error condition by
> "hot plugging" the CVBS input IIRC.
I think what I could try here is to call v4l2_subdev_disable_streams() 
from rcsi2_irq_thread(), disabling all currently enabled streams from 
the source, and then v4l2_subdev_enable_streams() them back. In theory 
that should do the same as the current code.

I also realized I have a bug here: enable streams does a 
"priv->stream_count += 1", regardless of how many streams the 
source_streams_mask mask contains... I need to check if this same 
pattern is present elsewhere.

  Tomi

