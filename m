Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13786310779
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 14:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001223; cv=pass; b=cjqqFgyMJkE6gbDRedfWQd/aBpmxnCKhd/5+hzUtcqCbtuOYJVtJTbl8cbv5EatvlaIED3On85KvBi6YD5isY/MBQMQUjihLcjr7oDjE1THsMUNFfd1iocFxMnOQ1vElUqsh1HOVYV1cXbJdIcvy4yxMhuwCUbKxb20f2WPuXso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001223; c=relaxed/simple;
	bh=DOLUHzyNbgypNt2Cb2gBz6juJ39hx7bJkNuPsJ+uwUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QxY1AR3H65eJBJnO7+h6FffKz+yA2C7x8Yp8KxGWWljX0G5Q/Mt8xEfVkjC37QDD97MIIHFmHIzqbvvINdNk63k231L9HzWUkazTwUfMZgAs/SLJ+x4wX+wwy/eRfi7MKl482KdLacHt+D1VwTDQkSStHwdkUYKbH5TJ66JXJGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fz87+HYF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BmgwOCr5; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fz87+HYF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BmgwOCr5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGbjG763717
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 14:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RN49HaPQGdrm1yb0dZkAMriqXQ6TCvsapV0/mYAPYOs=; b=Fz87+HYFeYV12a3m
	f+pMsxZZO/xAP7mGdkNmLg9WRgreu4SKgYlWEUyW1olZMk8HDHvixkPBy69Goewc
	SmTzNAm+yCwwXhxaFAD2ihOBXHTNFtfyPLpQMaRCbeOaAlRRusH1X5Nf9rf1RwXI
	Bl+YwLDLPPtw1e6wUWkCMPID4zX/jmT+bbKcVEAq6ktXjwOZHvCQ1hasqgUJy3bH
	EFAhd6vc/qo8ryuk++Iu8sJKR7wKR29WCcjsDK6QdqSC/Tmg/bsz2WRRQlzT/fUW
	JiqJLh7BqkVtrCIVES12YpVeTq+M+PFwGN//muv/Kcn2gBRMOEWbWZxvQ+/Y1A7a
	B7tCgg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj1jxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 14:33:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86261e66700so3050837b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 07:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790001219; cv=none;
        d=google.com; s=arc-20260327;
        b=SV3Eem93NHv8jEbeObOL+8HP3CtD2lOsZVji31HTiWqI8FPdg+F2gBEE0Gm2BWLA1a
         X+y9zde7fYU3WpqEDTYUTeSwEoV+2NHAxQ6Y4zRrjgthI/1H9bAAvS+fLOTkR/uDMNBf
         AyMsW/xi2+IsrVaoXY2CH+ZJkUIEzIDy+Twv+pTln2+hPbjais5MgN80izSD5fuooMRN
         /0GCzo3eWFf8LYWMjmedMjhQqFmdLFnhHLgr7polhuN/hcVWveO5lyLNPzsVODfx6WXC
         2wyfXA5XkYGSQF+VPvFuMF2K1uW9p2uxHv96fbuvcocEqCuGdnBkIn24dYfUuzAiGqzv
         0uFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RN49HaPQGdrm1yb0dZkAMriqXQ6TCvsapV0/mYAPYOs=;
        fh=s0l6qhdwem+S/cOr0fu7pNh+o7FpFJWfKN2iK2VQWPQ=;
        b=SqxdFCO4mUX+Sc1slPBrX7kAxhsBa5At4TXz6zdxFlT7bCY5MN8OaqkkEPAKrjK5hM
         e5ks8JmNB4UcTs0j3bxxl6F2k6cZHX8Oy+he8UnUtb9w39HrXzXDGKWADHi0yqio8FON
         W5ThRrSnZUsnBQA3OJ9gT6n/j5JarGE+osPz4q64vFD66HoFdQVvm5QMzEQP1KtxxH2U
         MyYz0PhTGpRVN7ks6iG5/P9tZWUxBnLjgf+Qv5Y4DZPRf2LDW7aq+om0eZiBTzwpeEIl
         Ft77/bgIpCTIzxwl+kORJomTUObVRiEPdIYWj4eZf51omk5CrVbJCR5kCS7AmawlJRu/
         UEwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790001219; x=1790606019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RN49HaPQGdrm1yb0dZkAMriqXQ6TCvsapV0/mYAPYOs=;
        b=BmgwOCr5kdbI8bdXYOA5XiNuJUaFFxDclH0Cuqb2SpnvqJCLYXWhfk+AJfPnEe7gCg
         g71kVUWsVBYIEF/V7D/ElABN9eFqC876wANi7S/Fwhfpf5lKGWMgWN7gm6g8apkO+kM4
         D5Ix3R4mkCD9Zk992oWgmOBFJxMhnkGDLwB7chY7nW7AtlmmsVf5kdLiV11zl5EKuJA2
         CVwPAe1Ma6q1pLNxqALI6xRPihCxM3o5NWJWG6F9HY6bEu+CXbpnoZGSqMKsMw6SZBvS
         M27b6sYqsLvsGuCHp97eJXQsDpxdHt8B1uGngUniY7nx6Pi+9RYbHeDYTVe2/Yz54mBo
         nlyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001219; x=1790606019;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RN49HaPQGdrm1yb0dZkAMriqXQ6TCvsapV0/mYAPYOs=;
        b=yonxpmQAoUwY/ca2rYaGo5hYZxzRcCwpAMwGUbA2NiCY2S4RSaZP5K/d3Qp4qN7Ong
         ilxsBSsfJbC4sDhcBjtm1P3xz1G6Hu/6xUQer/rQoF2FzSM8zQjr3X1Z5YfCjIMeHAtb
         EMruOZ1ZDKfCFHD+D552Astyq6OyaJWgM2tqyc4UqPV7VElU7cn5o3gTyRfjxiIZLi+D
         bxMbU+Ql9NZSRkczrEOQbjmHxwd+ILvsL2r5EREzRtQoGmZqB1y+ool4cYfoSwAl57o/
         6WYmLRGqNx602RYeSC8bOOJPE8835K80xN5NCY4Jg9ujqC7yHUoI9t0nq2SDrubq//Dq
         9odQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrrtsjOGxl8Jr0QNjG7m1GAByXj+K1RRm0STkcqpGMZ5rXHUNf3gf9Z1JnFFsmN+7X/wQkJYkz0uQWaCV1MUVfLg==@vger.kernel.org
X-Gm-Message-State: AFuF++mbHablhcPfZZIZfEEXWln/5AZ2t1Vb3yM29a39TMRxLPFMyQHG
	4l93k6fCWu5YTbsgCj2/a3GRCsK/zTZuc8iMhrvBclsls+pVfSttRaFwPPRb1sqKKDizI9rqEoO
	Mt7B/dvZRrZshuQwbUaSnOyEiGKnIkI+04+ZSmEnLUE35brH5NveJpM2Sztb13J1icfso0xP4/Z
	tyCL/7aNQJ2r+BdyrqIB9m39CIc2j8CMQlimv9x1EyqyugAHCdLo6AP8Tp
X-Gm-Gg: AYBFou1Nr8ocKqMk2MQOlP1nJHZS76cVXDd4CigfL9rlyoDJONVfN2A3t0h1MjyV728
	kjNYaLSfRTmNtMYEo0O9oY7kzoA8Rci99eX666Qfa8Hwx7xEWwUJo4VuFLhr0hmTTcS7gCjHoBc
	roB+ZbL4inyYj68nyxpkZzcK8t8cRqhwwhbBAVnibG8PGmKrpxY8Qe446nZA==
X-Received: by 2002:a05:6a20:6f91:b0:3dd:659e:5db2 with SMTP id adf61e73a8af0-3dd8c4413a7mr18266807637.16.1790001214405;
        Mon, 21 Sep 2026 07:33:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f91:b0:3dd:659e:5db2 with SMTP id
 adf61e73a8af0-3dd8c4413a7mr18266769637.16.1790001213920; Mon, 21 Sep 2026
 07:33:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <86da16a61c58eb08419f7528237c124e519f0a72.1788791506.git.geert+renesas@glider.be>
In-Reply-To: <86da16a61c58eb08419f7528237c124e519f0a72.1788791506.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:33:22 +0200
X-Gm-Features: AcwNN1Wd_6jxzpMXptAMEPqNJszFTSpjB9lLwhY1vA5MxxJu1fMZtdoj5lA9YJg
Message-ID: <CAPx+jO8y2Yk1KwAey2nRsjjduGbvfy=rHqsToDHhvf9sfMMNag@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: renesas: r8a78000: Fix lockdep false positive
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-renesas-soc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX5Ka+7sJJVeBJ
 2UKdSaiFi1VtuJZngan3fASjnub8hNaxZmhhGgugXZxz/hsvGpTrKgqhwSFoVF70FNSVIA+2cZk
 8JhJzLZFxN7P8nsWowh3TUXHldXK5Jw=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab14044 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=ZwIrdqM33KZ6HQH4p9wA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: bi4AD9Y93-p24V9mDB_tflEUySxsiES1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfXzaX7VoUWwvRh
 K12KV3AtYoZjoJhiFO2u9DLbpuF0eoZezQhH/+Xp8JtbXgLQ9eqqPJOvk2rYfHO3XTOKfmS/6+2
 U6ubqxmfD2LOnoirqThNm6xYuzRgOFSGzljcuOHnjhMHBOCqz/X1ZjlyNjvd0bp9JiZniDGpGF3
 mQacX3kReXsA4qy2irltbEZGsw6rhiedfv217ltsAeTb2TCxZ96yrJTy4ySE56x5GAcSsjtGcGC
 g1i+ZFpQ84bVJhOo7UBjZxKm7/08bgzK/toxF32wSJi/iAbCq/R9tO2C1ntbzpC3Pw9SV6EOBJl
 757W9IDzRDUoVqAXZFplXyEHVJPaN5+gmRp87VF9RZVLr9dZbzcZgIbCdvg79XO2pbYAMU3NR91
 ggoqYzyUi/Hh30bgzg289yH6sDOaY5/qIixsebDYnzfIZaeKJEYsAhEIi4HK64jHrrvOm59NnG9
 uJEHIt0DCbJnPC78nVQ==
X-Proofpoint-ORIG-GUID: bi4AD9Y93-p24V9mDB_tflEUySxsiES1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210211

On Mon, Sep 7, 2026 at 4:32=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Lockdep reports a possible circular locking dependency when attaching
> devices to an MDLC PM domain:
>
>   - During creation of the singleton PM domain:
>       A. r8a78000_genpd_always_on_singleton() takes r8a78000_mdlc_lock,
>       B. pm_genpd_init() takes gpd_list_lock.
>
>   - During attachment of devices to PM domains:
>       A. pm_genpd_add_device() takes gpd_list_lock,
>       B. r8a78000_mdlc_attach_dev() takes r8a78000_mdlc_lock.
>
> As the former is done only once, before any devices are attached, such a
> AB-BA deadlock cannot really happen.  Fix this false positive by
> introducing a separate lock to protect the creation of the singleton
> domain.
>
> Fixes: 89e6a71b35703f10 ("pmdomain: renesas: Add R-Car X5H MDLC driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/renesas/r8a78000-mdlc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/=
renesas/r8a78000-mdlc.c
> index 2668fc2ac9cbd388..1fd71bb3da776eb1 100644
> --- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
> +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> @@ -45,8 +45,9 @@ struct r8a78000_mdlc_priv {
>  };
>
>  static struct generic_pm_domain *r8a78000_genpd_always_on;
> +
>  static HLIST_HEAD(r8a78000_mdlc_list);
> -static DEFINE_MUTEX(r8a78000_mdlc_lock);       /* protects the two above=
 */
> +static DEFINE_MUTEX(r8a78000_mdlc_lock);       /* protects the list abov=
e */
>
>  static struct generic_pm_domain *r8a78000_genpd_xlate(
>                         const struct of_phandle_args *spec, void *data)
> @@ -191,10 +192,11 @@ static void r8a78000_genpd_del_provider(void *data)
>
>  static int r8a78000_genpd_always_on_singleton(struct device *dev)
>  {
> +       static DEFINE_MUTEX(singleton_lock);
>         struct generic_pm_domain *genpd;
>         int ret;
>
> -       guard(mutex)(&r8a78000_mdlc_lock);
> +       guard(mutex)(&singleton_lock);
>
>         if (r8a78000_genpd_always_on)
>                 return 0;
> --
> 2.43.0
>
