Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629482;
	b=5Yn5xHwAY72ghAKsVV/GUxz248XaOdv0fKmV9wSEHEOZnEMUs1EDBJHK1tIIM1r2M50I
	 yIaaDh7r4un2eQadbYBJH64837t1nwYTLRrp4SbkFuC+AZARyNagRasEuYOKDo/dO+R5R
	 wHSm3PF8ZrB6dVNUa/mvvYav9H42GL2YaiCRN7KAzQtivR9kIc2usQ6bmtIBKthJ0GjZU
	 nv+SBMp9Vl8ZYI7q6JkOAth23ajcOinwzAZbYuHXpdcvJTCH83O98puvm9OWR7D7aWXga
	 V67uGDWsCcYWXoBuGr5MErgFwjm82BFgcaZXW7dEmHtwCAN36xBAADg1K5XWWJgve8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629482;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZQjAckgBtWiMVAx5oIF4Y1KalU+IA7K2De70LN9w+Ms=;
	b=SzBUFkEXsBm8n3XvlpQBxsjsZuQctGlcy+o+9+wxOqFAPCw04G6zPhN/duxlBgl7q70Q
	 RUqmxHAUMQ8YH/A7vEgjW2Pq8tXUBuh3L8SzLfmaUSerB9hMELmkF8wrB/PFgOTMMVm1s
	 S4XgVwBUooiLvRQb3YI7JcNSTicQzJqOntg1iU00p0pORX3x6E60GNm3Ds1i9Kyht6mGq
	 xQruvj84ahouhEVS6G8QBZgmTFlIn6FwDwKw4GdWk7HRgtM7bUbdD1VlOqbgLYnVpnO4S
	 XzF7rnWK44GpV7DW6bEOJwYRl1EYPYVI2sBvDukLO3Pgxim1CxgkjvguHIfbD5ztmpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=Igalia.com;
	spf=pass smtp.mailfrom=Igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=LqpxnAUj;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4073C606A31E;
	Wed, 25 Nov 2026 17:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4073C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=Igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=LqpxnAUj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=ZQjAckgBtWiMVAx5oIF4Y1KalU+IA7K2De70LN9w+Ms=; t=1795629480; x=2110989480; 
	b=LqpxnAUjyIh+q9SBZSVZzeS62lDiLp1oemGJ9MTY+5FPpwjYiDLU1+HdSxm13N35fIxSvQX4OFR
	Y3mNm0r0L6a4gRg4RLfRos7E1YV3SziGR2DTzMHRxWyxKKIM3nAy6+vdUuLkS84jDBCOWSaNqoyo6
	F4nWBWcNVajynAX3GXy/bRreCNIuxWfunygNadpUanrEzv4PvjCJqD+temIKuaDCjb1DNOYvJUgG8
	OC/sTY32rAwtQHv1j36o+RI6FKbzC5Kwn/nvCkKgAEhtUgVmoiA0TRj8pOByTA9HRl1jwCzCmpPQz
	JjJs1nMl57cZEV8e6fXvZ8lL7qV4+tm5r3Rg==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91] helo=[192.168.1.133])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xWHFY-000000044Q6-0IvN;
	Wed, 25 Nov 2026 18:57:44 +0100
Message-ID: <951f3f8f-0f2c-4a83-b4c5-d1ab83b853df@Igalia.com>
Date: Wed, 25 Nov 2026 09:57:32 -0800
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
Subject: Re: [PATCH v8 00/10] drm: writeback: clean up writeback connector
 initialization
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Brian Starkey <brian.starkey@arm.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
References: <20261111-wb-drop-encoder-v8-0-62948ed87d13@oss.qualcomm.com>
 <179558244222.1572056.13569389105654454020.b4-ty@b4>
 <IA3PR11MB9325E12D779BB5DA335C6B33E3432@IA3PR11MB9325.namprd11.prod.outlook.com>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <IA3PR11MB9325E12D779BB5DA335C6B33E3432@IA3PR11MB9325.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/24/26 21:00, Kandpal, Suraj wrote:
>> -----Original Message-----
>> From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Sent: 25 November 2026 10:24
>> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
>> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David
>> Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; John Harrison
>> <John.Harrison@igalia.com>; Harry Wentland <harry.wentland@amd.com>; Leo
>> Li <sunpeng.li@amd.com>; Rodrigo Siqueira <siqueira@igalia.com>; Alex
>> Deucher <alexander.deucher@amd.com>; Christian König
>> <christian.koenig@amd.com>; Liviu Dudau <liviu.dudau@arm.com>; Laurent
>> Pinchart <laurent.pinchart+renesas@ideasonboard.com>; Tomi Valkeinen
>> <tomi.valkeinen+renesas@ideasonboard.com>; Kieran Bingham
>> <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven
>> <geert+renesas@glider.be>; Magnus Damm <magnus.damm@gmail.com>; Dave
>> Stevenson <dave.stevenson@raspberrypi.com>; Maíra Canal
>> <mcanal@igalia.com>; Raspberry Pi Kernel Maintenance <kernel-
>> list@raspberrypi.com>; Louis Chauvet <louis.chauvet@bootlin.com>; Mihail
>> Atanassov <mihail.atanassov@arm.com>; Eric Anholt <eric@anholt.net>; Rob
>> Clark <robin.clark@oss.qualcomm.com>; Brian Starkey
>> <brian.starkey@arm.com>; Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com>
>> Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; amd-
>> gfx@lists.freedesktop.org; linux-renesas-soc@vger.kernel.org; Kandpal, Suraj
>> <suraj.kandpal@intel.com>; Chaoyi Chen <chaoyi.chen@rock-chips.com>; John
>> Harrison <John.Harrison@Igalia.com>
>> Subject: Re: [PATCH v8 00/10] drm: writeback: clean up writeback connector
>> initialization
>>
>> On Wed, 11 Nov 2026 02:42:29 +0200, Dmitry Baryshkov wrote:
>>> Drivers using drm_writeback_connector_init() / _with_encoder() don't
>>> perform cleanup in a manner similar to drmm_writeback_connector_init()
>>> (see drm_writeback_connector_cleanup()). Enough of the drivers don't
>>> use the encoder embedded into the drm_writeback connector.  In
>>> preparation to further rework of the WB connectors (as planned to
>>> enable WB for i915 / xe drivers, which would move
>>> drm_writeback_connector to be a field inside drm_connector instead of
>>> subclassing it) remove the drm_encoder wrapped in struct
>>> drm_writeback_connector. Rename the
>>> drm_writeback_connector_init_with_encoder() to
>>> drm_writeback_connector_init()
>>> and copy drmm_writeback_connector_init() interface. Then, with the
>>> encoder being gone, handle proper cleanup of writeback data in
>>> drm_connector_cleanup().
>>>
>>> [...]
>> Applied to drm-misc-next, thanks!
> With this series now merged can we also go ahead and get this series
> https://patchwork.freedesktop.org/series/152761/ merged in drm-misc-next
> Dmitry, John ?
>
> Regards,
> Suraj Kandpal
Sounds good to me. Does it need to be rebased first? If nothing else, 
just resend without the 'do not review' patch? I guess it's only two 
weeks since the last rev so maybe it's still all good?

John.

>
>> [01/10] drm/amd/display: embed the writeback encoder in
>> amdgpu_dm_wb_connector
>>          commit: 283a3cfbb29cf3d0af1ad03012fcd049dece6e64
>> [02/10] drm/komeda: embed the writeback encoder in komeda_wb_connector
>>          commit: 9d5cdb46eed94ddee3732fbb5f8c008c798aba51
>> [03/10] drm/mali: embed the writeback encoder in malidp_drm
>>          commit: f07e5e8eac86bc7db2ffdd2e748e256ee2b419a1
>> [04/10] drm: renesas: rcar-du: embed the writeback encoder in rcar_du_crtc
>>          commit: 12c88af117c77a1604bb02397cb2b622c47da9e6
>> [05/10] drm: writeback: drop excess connector initialization functions
>>          commit: 7bcb37603df095e56e87d6144201179fe911e4dd
>> [06/10] drm: writeback: rename
>> drm_writeback_connector_init_with_encoder()
>>          commit: 81f61b4e0467ddab3695be58a94fc322c8bd559a
>> [07/10] drm: writeback: don't destroy the shared writeback properties
>>          commit: 7a5c8848606a9c1c9a57dab4332c9445c7f1d60f
>> [08/10] drm: writeback: clean up writeback jobs outside the job_lock
>>          commit: da12cfd8400b7b2fd00be22cdebaf2efa6299c68
>> [09/10] drm: writeback: clean up writeback connectors in
>> drm_connector_cleanup()
>>          commit: 2bed5919e005687d163d1b6d273db450449b8bdf
>> [10/10] drm: writeback: drop the drmm writeback cleanup action
>>          commit: 616a651a5be4655d2cceed0612f70f076eb24cc9
>>
>> Best regards,
>> --
>> With best wishes
>> Dmitry
>>

