Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40F9471269;
	Wed, 29 Jul 2026 10:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322592; cv=fail; b=FglSKl1mGbihI+auuB7jZenn75ko52oOb6LzAYBvIE3hhD1kE//nlXuhCBAPGtjmqgPW2/AGLb9KUv9OyKZrAn2CetgjwKysD3/OXj5roWXuNwlxadL74ROAUsMGxsoLVpG2RKT47/0hYBtopPq3nFPu/iHpg2/Ox+sgOl4Z1nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322592; c=relaxed/simple;
	bh=SUTkaKvDuSSctsugHvBgH+I/EJhA9gVbCvCqQyVFCi4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aVcyib/SWNBDbVc0eWDOt3IvjoSw70zZcemN3dpNbBScZeR7EKeJBS4E48lFyeD5Zl/3NTQpYOH7FkvxfqWcu6K1i2NPvWy0vRdydMhU78kawYF/OS9b662N+CrIohNUkYjZOW/7IUIsQXVeQeYBDh79IJzmDRxv37zyyNtgtg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZZLg86bI; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZZLg86bI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhopYd9WoaA2/tnZcEKUJeIP2MO94dZ4v1BTDq/h8GPVzgmPbYJGiLLsAzodszow8eZqHC+GSE6Yl5FqThkFooJtQDUNeq0wFfgeyyXVZahcdwETzzV4o4cDMp4iXiL2kV4Q71z70d3CV5TTAg6tM5WOGd2V81eA3TRIg9+dz4VRab0uPPB+0gUEPVrIQp1cUevlNFfoMqvJ8RGswy8KzR9YnON8awf94Ep8LTLZgu2lt9iTtLNjkYokgrdT2jhMwwdrZgH9VKNzaGCGgU7zU9BRl/Lm/8Rd7c1raTWXkcCAu6piCm7jLZ6TE47nkHtoRdR3SEAzD73oArrtiVoT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sej1Rrxe8CzjcjSSB19GAYGnmOSFPtH29R0NHC7g5vU=;
 b=N7J/+h0A4OGdlB5vuMkazUmNkOoc1LeGB5DKejXuIIy2sh+01fnhYpvAsIZVILjOtUZ1Fu8z8yc+ImRuq1+KgEL0bT0etojMCAA3EPZafdFcEduDb/IBSkin2EIVyoDYaNi+bhfP+FqTKIdrviGlIKHK+As+EGVPoIt+tCZCDR6Z7LHhP41x6LHLIGRxOvOdTIKYXCq+GH9Jvwtdn4Zk8oYn4K6V2UbqYVvZSEGpXYrvnZp5Dth3djShN3wOIRiSDFkMgfE9WFQhprUsmxRIOTst2keYWDKe2ZbuNsj+Zmq7nQHy6DPpPB4CvYvqL/Z4SBgdLkQz+SfGMciUTxd5Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sej1Rrxe8CzjcjSSB19GAYGnmOSFPtH29R0NHC7g5vU=;
 b=ZZLg86bI7T1dV8pChmvAC/D52BPq6IKIAYtMjhUMYwaEbT9ktwC91eB7jag+HjJiIDMv7gc98DB5XdLS4bRtc6ig+EDJf8rlNJmJCADaa/6Z6mcrMfBzpsGh7M2orhngce6dpRPyp8EUNeoFWL+fPEr1iwk+1MFD1xakjOwpft0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYWPR01MB10274.jpnprd01.prod.outlook.com (2603:1096:400:1e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 10:56:26 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 10:56:26 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/5] media: rzg2l-cru: Fix DMA stride alignment
Date: Wed, 29 Jul 2026 12:55:45 +0200
Message-ID: <20260729105603.1160966-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0207.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::12) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYWPR01MB10274:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a2a228-a3b0-429f-0ecb-08deed6008f5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|38350700014|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 H37o1FCEGMVUzMZ9AvRaHAnwTg1UreHcXFZ1YyaiIPxAl4473e+VXquFz5f0+enCj7gGyYCMStBPkPIgsUQYbbFp5Co9RR6VTNPWQjKEayqqmSHCyFBtxFYfQ8Kl3Z+VwLOcd+rgQ222+NtfoL9YG6ZEWP3dsA3s2hQxsXYqQed5GGZVx43nnzdjcggPMzs4VVCK+f2mbQPB+RZGky2zQLmLtKSO9kE45ROrX5qc89RjabuDn58AeteBCepgfXIc4gElZv/Ktx5TQRBx7f5vo9dXA8Hx5ZyR4Y3Ga7OidE+zAdnWvt649pkZj5NO5bb/+vFMNzYBPGG6bbv/jKgHn3NY21Wy+jG+GV7DO/T8ga3mVOn+NetlSLQ5auD6STEQ0UAKEw0DERz2o2S0k/odAXZY0YKKnYqEgvqJRe6hwsK7Or5aU+I1AX6To8iARJE+tR+thE5LscudBjcL0uwuNiIJHESdB7NRRmj7CEGm6A1Gwuz95oLNENL/j2vYJ0+XX3XSiqYtzf/1Im2mFAsNgtrQKCUoq/bs/N3LYtvPpV+30FNtWg1mHANB1J9YlFMBqztt9JFiOvkwhyF/ndOYtlz18TL2VRTBgBg4pKliVpBLZL0zanv58nFDlrej50i4P4Be2fDzBoiHU3lkwZCtCiXDj0cfcEpV5IUoaBNMfplMqXmKx17HNyDbctYmQedwVoJ97Dr0FBNSGSnc8KsJLwzRu1UYNiOBwmjfdu73prw=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?L1ZFemlJd0lYL25VS3J3STBUdXQ0Q052dUxGMndJQ1ZiWmdrSStLdmtuK3Fp?=
 =?utf-8?B?TE5RcE5OVXZESnJaUUNXNTFzZzF3TTU1Y3Jrb1RlZXlqK3pwelVsMHFGY2FG?=
 =?utf-8?B?N2NlVGpPYVN5NHhlM0tPeHlyNFA0RUNtQ1FPTUkyK0ZXdnliNGJzVlhlbUR4?=
 =?utf-8?B?WXEyaDZ6WnJpcWUrYUl5Z2w2QTFSZFErVjlEcVVlMkVNdm1NaUdIeFZUNGhp?=
 =?utf-8?B?VExXTStEMnVEbFMrbmIxZ3RRNFpOalNoc3dZWjAvWnRYczJyTjNTVGRNbW9m?=
 =?utf-8?B?M1BsN09kL1ZDdks0cHhvVlZGTnI1TFV4VDliMDhiYVBwLzNHWmlzUXNaWnRn?=
 =?utf-8?B?bituKzVLdDVLbkJ3enQzRDFCN2cyWE5XM3VrTTBzU1FYZ1pqV09DeXpzeVov?=
 =?utf-8?B?R0Rvbk8rOFhhRUsxZ0p2MnF0Yks0eldsUzkwQU5pQzZCa2VPUTI3TDMwOG80?=
 =?utf-8?B?QnI0Sms5NG5QTU16b0pBUmF0TXdoV3Z6dTZaYzYySHAxMlFBWDRvencvQXc1?=
 =?utf-8?B?dWJSaVJwNGpRb3RBdFpHSmZIMFdVQklGaFR4cERKaHNGc0Z4VDNHSUI4T1pu?=
 =?utf-8?B?UEYwUFZZRkFiMzM4VmdRbW1WNkdYbjdaVWZxQ2x2bERMTlBhZUxQWDZ5dlFh?=
 =?utf-8?B?c3k3OVNnK0c3azZ3MCtpT1hIM2JxNERhVHhESW5xY0Q5RUQ4S3duTHBBeWhY?=
 =?utf-8?B?c0EreE1CYWtzQlU0VjNzUFNQbjN3SFpicUZlclJmNm1BdzA4OFJ2WndBSGho?=
 =?utf-8?B?cjVpbEZBOU5GWjlEY3NwY0dYdjVmcVd4ME1XL2JZS1RxWlVKRmF1VHdGeXll?=
 =?utf-8?B?MlIvNTlTbUR5Y1lXMzF4VmRLQVdheEhEanl3WHgzMUZXbmc3WTEyUzFGZ3lP?=
 =?utf-8?B?ak1ZQUhZZlFlckUvREJUeFNGc3NJQStYWVN1YThwK0pDU3p5ZGxIK0VCc1Qz?=
 =?utf-8?B?dzlFeFdDczhkTW5OMkp6T1YxbUJJeFpBNXE0SzAzVHJVYnBTeHJ5UlBNOEN4?=
 =?utf-8?B?T1pTV3d6eUk2REdCWXhsTTZ5ZjNrcEMvMjRwSUZUa3VTSWlXOXEzNHFZdVMr?=
 =?utf-8?B?S3o2WVNianRzdnNmclM4TFlEYjNlakNGWXo5cStRWGFOVGVLSzJ2VWNjOFVR?=
 =?utf-8?B?SjYwNzJKLzlFdjRPQ25uZktvTHlQYjE4bDF5ek9zcWx0NktvK0VFMmlaUThX?=
 =?utf-8?B?cllGQTZZK2hrblJPZE9DT1dnWkg0RHZydGJYdld3RWdTQkp5MEJoeEVWZGZ3?=
 =?utf-8?B?SmowNllnSmtkM2pUbDgzbVhkTWE3ZzFJSGhia2dPNnVhWU9ZUkRXZzdGWEpG?=
 =?utf-8?B?TGh5cFJtV09jRkhsT1Qra2tFQ1p1QTI4L1IrU2VJcGlMdFBoVVJyT0ttTXkz?=
 =?utf-8?B?dVZTU1JTcEpUYU02UWhuQmZUWCtPUlYzNWxhS0QxQnF6Yk5vTlhyN0UyeG1Y?=
 =?utf-8?B?V1l6QXM0K09xMmJwSUk5UjJUVlM0UkVMb2lZZnlXaTJtOStOUkpnbkFTaCtn?=
 =?utf-8?B?Z3ArdVhNcWFpR24vZzA5NjRWOEpyblZIU3c5MTZlaXUyQnhrSGxRZEdOTi9m?=
 =?utf-8?B?VGE5N2VqNFoySVIzWnp3Tm43WWV1ZmR5SnZzV2VVakxlS0pQeGdpaWluN0lE?=
 =?utf-8?B?aUlwYTdzOWF0Q0MrdENybWUzVlpDeVdZaktKWnRoOHZaN1JWeEhNaTNVcTN5?=
 =?utf-8?B?QVFnRzdFK0VabnA1NXI3UkNJWEpvY3p2dDB2Vm9WUU82dzR5Z1R0NCtaZkVz?=
 =?utf-8?B?aTA0cFBNd1IzbTd3TTVlREFqM2lMdkZwaEd5ZVNRbVRjUlhxS2VBdTZrNFkr?=
 =?utf-8?B?OUpnRmxQdEpvLzZ1UUNkL1lYUVByQUNvajZqQUNlZTNZMXRBWTVoNUo4a2Y1?=
 =?utf-8?B?UFNoMFJGTU1xOXRiY1BHTDd4Y0ZuVkFzRWRsK0J2d1g1REpCTVlJMWM5WmhN?=
 =?utf-8?B?WXhsL0FsMWU0ZzVKSktPR1JqQ2ZsdnFVZ0xxcjZDTVB4TTRadGVxOVFLZCt6?=
 =?utf-8?B?b1pGbmZ6TFpqbkd5ZGNZUTFjcytQblNCRTZXNkVhU2FIbmRFNWNIT0hOVlRQ?=
 =?utf-8?B?WlNvUnFORmNJWnI4d0I5bHNPSlNhdUpFVHBLZTBDUnpXaFBNNVcxV0NVc3V0?=
 =?utf-8?B?ZGQ4ZUIzZ1NNTFJLM3g5SEtkWHVVR0NuU1I2SFVaU1RZaHVEdVNtOFhaWXFE?=
 =?utf-8?B?Q0VCUHYxcUxxSkJKdi9MZTRpdEpTdDQ1SnMxQU1aeWFzYmVoYU44MTFIOGxQ?=
 =?utf-8?B?TllTS1R4RHNxVllVbENFekJpVVZDTmZvS1F0YndFTkppMHRwWFgyb0RRclJl?=
 =?utf-8?B?SGt0d0JxZDV3d0w0TEF6TUJ0RjQwZ3hUcEp2bjhvUmcxWHdhVTE4RjNZRGVL?=
 =?utf-8?Q?/POUk7w11ABpf1vxgEMODA2HbIlrYWllJTbv0?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a2a228-a3b0-429f-0ecb-08deed6008f5
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 10:56:25.9669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbNGyYlHaNucHhYjxFISZ0Wj//PxTt0Soxav8YJ2UfVc23fsgUsZxt4q3tHgoCGilE5z4ydik26AlSbpiytadx86u6a8lGvJFQT9LMqJDydU0q9Nmo15WIljIFqIHrCD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10274

Dear All,

While testing ov5645 + RZ/G3E we found out that the UYVY8_2X8/2592x1944
is broken. The issue is that the CRU DMA engine requires the line stride
to be a multiple of 128 bytes (RZG2L_CRU_STRIDE_ALIGN). v4l2_fill_pixfmt()
sets bytesperline as width * bytes_per_pixel with no alignment, so for
widths whose natural stride is not 128-byte aligned the hardware silently
rounds up, causing a mismatch that produces visible horizontal banding in
the captured image.

Tested using:

media-ctl -d /dev/media0 --set-v4l2 '"ov5645 0-003c":0[fmt:UYVY8_2X8/2592x1944 field:none]'
media-ctl -d /dev/media0 --set-v4l2 '"csi-16000400.csi2":0[fmt:UYVY8_2X8/2592x1944]'
media-ctl -d /dev/media0 --set-v4l2 '"cru-ip-16000000.video":0[fmt:UYVY8_2X8/2592x1944]'

v4l2-ctl -d /dev/video0 --verbose --set-fmt-video=width=2592,height=1944,pixelformat=UYVY --stream-mmap --stream-count=100 --stream-to=./frame.raw
gst-launch-1.0 v4l2src device=/dev/video0 blocksize=76800 io-mode=dmabuf num-buffers=200 ! video/x-raw,format=UYVY,width=2592,height=1944 !  videoconvert ! queue ! waylandsink sync=false

This patch fix the issue.

Kind Regards,
Tommaso

v4->v5:
 - Rebased on top of media-committers/next
 - Split the fix so it no longer depends on v4l2_fill_pixfmt_aligned()
   and moved it first in the series, so it can be backported to stable
   on its own (This the old v4 PATCH 4/4).

v3->v4:
 - Rebased on top of media-committers/next
 - PATCH 1/4: Collected tag.
 - PATCH 2/4: Collected Jacopo tag. Removed "." at the end of the function's
   brief description. Removed "component" from @pixfmt->sizeimage line
   Removed wrong tab.
   Fixed example (e.g NV12) -> (e.g. YUV420) into function description
 - PATCH 3/4: Collected Jacopo tag. Fixed into "and each plane's sizeimage is"
 - PATCH 4/4: Collected tag.

v2->v3:
 - PATCH 2/4: No changes, just moved to from PATCH 3/4 to PATCH 2/4
 - PATCH 3/4: Moved to PATCH 3/4, from PATCH 2/4.
   Fixed documentation as suggested by Sven Püschel

v1->v2:
 - PATCH 3/4: Move v4l2_fill_pixfmt() into v4l2-common.h as inline wrapper
   Add v4l2_fill_pixfmt_aligned() helper documentation.
 - PATCH 4/4: Collected tag, add missing Cc stable, fix s/commit/Commit/
   into commit body.

Tommaso Merciai (5):
  media: rzg2l-cru: Align bytesperline to hardware DMA stride
    requirement
  media: v4l2-common: Convert v4l2_fill_pixfmt_mp() to static inline
    wrapper
  media: v4l2-common: Add v4l2_fill_pixfmt_aligned() helper
  media: v4l2-common: Add kernel-doc for v4l2_fill_pixfmt_mp_aligned()
  media: rzg2l-cru: Use v4l2_fill_pixfmt_aligned() for stride alignment

 .../platform/renesas/rzg2l-cru/rzg2l-video.c  |  3 +-
 drivers/media/v4l2-core/v4l2-common.c         | 20 ++---
 include/media/v4l2-common.h                   | 75 +++++++++++++++++--
 3 files changed, 79 insertions(+), 19 deletions(-)

-- 
2.54.0

