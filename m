Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795582446;
	b=3W0gO1xFTf8Y2ebF77X60JJDOweC4IKFDzi+OsQQa9XlRzwTYOktdzPUV2EAG2YiYFeI
	 Y0JvWWUN28l45rMpgs/2d3p71T644vFOsiliAJMWJMfqaY1lrrZJz77UNrbu8r7PHbNTt
	 nmPMVib5ruu084naNzq6hChJgu93tCae2bUqhELukpsPv5aN2QiG50VjIj7L5sVU+Dp0c
	 Y8pswqNYDzDQYNzgFj79TIV6P9eODUbEGv8i9sySOLZtX9TXFeBa/Jz5xCnXp4L03+yQh
	 JdSrwwurexZbKRunPOoFdfeAfE8C26h2hyInVHH8ai70Vw7CMDHTulu9saz/f7iS8vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795582446;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3s86VvG7B0bhUerbEXUlNzOcbhT+/CsYmE4Xu2ZdCi8=;
	b=Muud9x6SdnliTo+GqDM3Elo7mPq8Sx3uLs7qnbUgrGRR/md9RfQTfh/+t6xG4rjYB3GM
	 mXzK+FdHMUhQqCLOiL+wOJEc23e8FRcMQCYdMrbUNw31mUEF7RG+4AM2iQd96+U7N0DdG
	 N5DbGi/J3LjTajtdeuWrNgCv8LoJpaeAoRf5Y8dwH5IcrGwb4cXbQKoQxbbXHBprzoah8
	 Ojh2F5kHdF7EeC95fII9K3hISWl/wIKWyPtZbnDqrFNpT6JTyAYOWCoKMA44BwzpRiBJR
	 2WMQNefNkryopelNVKXS2Fwxhr/fgoMSN2hJQloNEywlcs6P84kKe2d2J/Ys++Ej+Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pGyXrgBS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C4Bnont3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1584606A334
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 04:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1584606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pGyXrgBS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C4Bnont3
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2s78b578100
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 04:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3s86VvG7B0bhUerbEXUlNzOcbhT+/CsYmE4Xu2ZdCi8=; b=pGyXrgBS0CVfPhAf
	F+DmeoCK04ETuCxvBx12lZym1mVvH962Bi+++BwWoB+o86Kw/1CRepy8fFzd7Rvo
	9k/oGNASssh9o744hg2W06Csl+pR9OfhSKTuv3eb9QxuCUQYm+RU7UtjLHnG5EPx
	zYGUjBgRoPYpYJrPH45PCm58btSVE7MvCDFw7Dt9GoJsYjLBKtzk7ck2YW4WPzSJ
	H7oiryhwoBYv7znOos5DP5QVfNpjIu/sP219f3Ef78C5Kf67cJorT9+srk/3a3zM
	xmQlpF4zhCaSRgmNr3m9uwaAUiasOToYilw4JHwJEsHAKxEoE5eDwdrdsRINXdgD
	74s1NQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa28cb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 04:54:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495c71055bso115581785a.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 20:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795582444; x=1796187244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3s86VvG7B0bhUerbEXUlNzOcbhT+/CsYmE4Xu2ZdCi8=;
        b=C4Bnont3elN75N5X1q+B3pjh8ulDQgsCAr6T4Rl3UpZDCpudIREU6aNC6uHx6cAUvq
         xIEFgLDnC2OhaF0WVrwgwM63rMdDSbDSh3N0QlBgAXBJEAgszeCdhafPuhObqSPdW871
         MBPbrJYX2g9EPAsJyXXLj7NPg/fyoAHgXz7Om1TuEu5RpbNxcT4G0irY3CSpPiQNRQJn
         y9tEMKBCIwXwh9jQ0GWeVrRj6D1kdkP/LuBAt32hQN75isGT3S7bqYWnt3Rfj/TjFJE7
         WFBEz5GWeUx4LF9oE3tZFghhsePquN86iDrmHRX/hEpXgYNAGGgUBQ4GaGGm5odwRusa
         PfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795582444; x=1796187244;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3s86VvG7B0bhUerbEXUlNzOcbhT+/CsYmE4Xu2ZdCi8=;
        b=uRjrS7b5ZYI0k5VNIbQFFDUUjodQENZjwYuon/h25B8QFDxWUT3lxJ0A8E3kKYoPdq
         Gr4KRcEh7xrs0nzOw45oxoaQfZOpFvfWdaEcFgtJZ7Ntofog67MXPv5lx75aNLypwyk7
         SSfutfc7W3BWrlKV7v3z8paevxeSeTjlI6UhQuEMP4k+Y2y2JnK49kATNAJDMO/02lkz
         AdWlOtxNIzNOVvBAbKdb/zidSvwoUzccGFlSw6AuKGpkIQcS9mQoZcQrfH9Rb312FZWc
         QnGkq9iU5nhg7LHzzj5z5j7X1EYNXH+xY3N5iq4ShbK9FbU2js1SF+wItFJwy0UoZe6d
         J6RA==
X-Forwarded-Encrypted: i=1; AL+hErGB2ABI0vQaLJCt05/6QoIACd3Q9sUACyCvHiYLfMR5gYskhEPyYwm63cwpQ0c3M4aO0434auftyGmXVHXQlhFGqA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/OcLCW6HeyW3z8slZA85Not69yRNe35pgrr/C/FgkHE4hn9GOC
	jErLLKAj6jCVWputv6P5Zqtui1a095ML90Jc0CtUvLOlaPRrZmln3ksSamplFQ4i6zaSJX/anAM
	TPG/NUGKxz3qf/R3pEtb6UGEV6XMAifMeCSkysUPMW0slu1sZw10211UhgNpvqJY9OKpEG24obA
	==
X-Gm-Gg: AZFdTZeSnBwpiokCtoZXMCEcfuJ3vwF6xW79U7V9nO4kIV7v4Q/QpC5EP2bqLPM9pan
	y/jdFOZqrQOZC7fpvO0ajNqL0TSqZq0Qdoxr8ZEnNL7EfMTxiKDPZlZLAus475DGYJeshCnz5f0
	59yNgITHKUKLRoefoPH6iT7CFOM8RsL8UdCf5OMqnDptbcdmoRMtj+H6oWJ4FBdMEn4tY+4BHFN
	OKrb/rS+uQygk1GXEsuRwnxiw3X3kvNp/5NJa3AV6Y4F0kHvgB9x4iqOHdTTQh7Zh5s43fvfAHG
	iQZnH2Pq1y6MepBF2AxpOU3GP9hsM1YgtJIXGjPk1qNlg84N9jgIYma4nMWULhfFSSHZnIIvOrS
	w5aH9owH7jT2FbqaHIc4/lh9juirsyCHzHmBmsTb96by4Q6ul3/IGii+KOmSLd9T+bCG5r51v5s
	Go+nBryYE6V671IW0/1sWWW3+inDXEOG3wTAhoACcJhPEUQSPbS0KWhzQGcLXEsw==
X-Received: by 2002:a05:620a:130f:b0:93f:2ae1:ea06 with SMTP id af79cd13be357-949bab20007mr2846366985a.44.1795582444201;
        Tue, 24 Nov 2026 20:54:04 -0800 (PST)
X-Received: by 2002:a05:620a:130f:b0:93f:2ae1:ea06 with SMTP id af79cd13be357-949bab20007mr2846362185a.44.1795582443689;
        Tue, 24 Nov 2026 20:54:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff6e32sm4243023e87.17.2026.11.24.20.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:54:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        John Harrison <John.Harrison@igalia.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Eric Anholt <eric@anholt.net>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Suraj Kandpal <suraj.kandpal@intel.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <20261111-wb-drop-encoder-v8-0-62948ed87d13@oss.qualcomm.com>
References: <20261111-wb-drop-encoder-v8-0-62948ed87d13@oss.qualcomm.com>
Subject: Re: [PATCH v8 00/10] drm: writeback: clean up writeback connector
 initialization
Message-Id: <179558244222.1572056.13569389105654454020.b4-ty@b4>
Date: Wed, 25 Nov 2026 06:54:02 +0200
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: X-pwAuEDfFKMIQ0LWrb14-OT63nsIV7O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxOSBTYWx0ZWRfXxoCTg+IRXjs+
 bEk9utEadNE7XCHayn9t4inEMXeuJ3ESD1DKDMLXHc/O70aWlEuILbDBgzwr50aup7sXAB3B0uK
 UjM2Aq/JW5nWZdNr90ySgQtVmRnF0aA=
X-Proofpoint-GUID: X-pwAuEDfFKMIQ0LWrb14-OT63nsIV7O
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b0669ec cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=t1lj0SIDRZ1apvpNlpYA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxOSBTYWx0ZWRfX5WxnN/nxLXn4
 CbK2O5kD3SUDajTjwIlPlHXxdSvmP/0EkdB+XWM6io4iy398rJ9kznh8WCkDJxO1HWjWoX0kZzX
 u+fYun/LuKVVFl84+6e/qaGm9tEK/WTyQOgTqXTupNqweAQJaQemYFARnb0InvGJwUYkG9Qdnix
 tCN2uhRxGuWHr+CtIuFD7nCKlcE+riFiC+aZNamkFSgQPopjcs+2Ge6uzSLJxBiC7j6UZIWnEKY
 TeSG1Rao9OBNXLXVMLW3TdUUrlRjlRL6qJVFWik+gmEABtwRi48WELtW6velGn1voQmVuhrHJpq
 P+T61ntcVXWQxHlB6DJAGQRmS2hdhmipmTi+fsqdB7lslmNigmEztzaw2M1ancDHrymUA/F+ukS
 B8DAo199/l0Po3ERb+q0qfz3A7lKY9ECH1+FjgV/1or11+YtH9/pukjgdBwWuqXw8ok1IFEndur
 tblfRGEVZD01Bl4k32Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250019

On Wed, 11 Nov 2026 02:42:29 +0200, Dmitry Baryshkov wrote:
> Drivers using drm_writeback_connector_init() / _with_encoder() don't
> perform cleanup in a manner similar to drmm_writeback_connector_init()
> (see drm_writeback_connector_cleanup()). Enough of the drivers don't use
> the encoder embedded into the drm_writeback connector.  In preparation
> to further rework of the WB connectors (as planned to enable WB for i915
> / xe drivers, which would move drm_writeback_connector to be a field
> inside drm_connector instead of subclassing it) remove the drm_encoder
> wrapped in struct drm_writeback_connector. Rename the
> drm_writeback_connector_init_with_encoder() to
> drm_writeback_connector_init()
> and copy drmm_writeback_connector_init() interface. Then, with the
> encoder being gone, handle proper cleanup of writeback data in
> drm_connector_cleanup().
> 
> [...]

Applied to drm-misc-next, thanks!

[01/10] drm/amd/display: embed the writeback encoder in amdgpu_dm_wb_connector
        commit: 283a3cfbb29cf3d0af1ad03012fcd049dece6e64
[02/10] drm/komeda: embed the writeback encoder in komeda_wb_connector
        commit: 9d5cdb46eed94ddee3732fbb5f8c008c798aba51
[03/10] drm/mali: embed the writeback encoder in malidp_drm
        commit: f07e5e8eac86bc7db2ffdd2e748e256ee2b419a1
[04/10] drm: renesas: rcar-du: embed the writeback encoder in rcar_du_crtc
        commit: 12c88af117c77a1604bb02397cb2b622c47da9e6
[05/10] drm: writeback: drop excess connector initialization functions
        commit: 7bcb37603df095e56e87d6144201179fe911e4dd
[06/10] drm: writeback: rename drm_writeback_connector_init_with_encoder()
        commit: 81f61b4e0467ddab3695be58a94fc322c8bd559a
[07/10] drm: writeback: don't destroy the shared writeback properties
        commit: 7a5c8848606a9c1c9a57dab4332c9445c7f1d60f
[08/10] drm: writeback: clean up writeback jobs outside the job_lock
        commit: da12cfd8400b7b2fd00be22cdebaf2efa6299c68
[09/10] drm: writeback: clean up writeback connectors in drm_connector_cleanup()
        commit: 2bed5919e005687d163d1b6d273db450449b8bdf
[10/10] drm: writeback: drop the drmm writeback cleanup action
        commit: 616a651a5be4655d2cceed0612f70f076eb24cc9

Best regards,
-- 
With best wishes
Dmitry


