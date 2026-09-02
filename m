Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F0946A5EB
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Sep 2026 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345874; cv=none; b=FGITtv4gB1wq64Nm4X1QIA+1oTuduH3QjXl56cpC5AbahGJU3xs6a2KwMcLcJgo22wT+mOlHWnOgHc01bS+3rD4MHe1yr7mNZ1dhwA3karUbsHF2CeFFOhEQTRmRyjitluCqr9ijH+hYBpgYPteCeJ+BS1XDaD281EaKdabEWLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345874; c=relaxed/simple;
	bh=L/8fMTR/45p2Bgt7Oq0/m23ikeBGM1Y6DORM+lyIJDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F0tPWdI7F7e/tkHXPKlTKokPaDhNgqw3a5omCsge1i/vdRJqIixxlYzRSjytpPTgmMZkeme1tp/4/lQ8KUDYvBmPFgysW5quPdGNosvsG5Ffgum+P8NnjqtdYqNQUoPagn7H3TAgeL3eph71ezlHlFqPeNIyhH8xWv6LcozhprE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4XL9uVb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PuL0c3nT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4XL9uVb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PuL0c3nT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829N9ap2246253
	for <linux-renesas-soc@vger.kernel.org>; Wed, 2 Sep 2026 10:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nucwFt37zXBwQFN0WyrwqjTBOM2Ta92KWejqAkDMZ8g=; b=g4XL9uVbjwJUVEBU
	PMdxXwVAG1aSs6e5KLaLQpB5NTR19CN3OYA0xfOFAv6AVLUtn+3DR0xg48DPziXu
	tbUhprMWXkvqHDVBpx4rvL8hnYe64Ivw4IrW9mRzYFN4mzItchooodKXjCn+1rdj
	xGqhw1Ok9V6S5ts3cdgnpKxyqqZsJQ9kwrsDNDojfH9so2cMPzmFOx7SznTbdMuF
	lShjkWdAX94F/HGmmy1ps6BSIm+VMFELI9dkCAXK6yZdwTXU9lIcDBrAaQq+PLnZ
	eDpc/rnVhkbTZD3MRSbyxIH9sHKwOxZN6TbZatFJLxXlaALBUvdABbSbYTBraQY0
	+/IbIA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge8whj47v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 10:44:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930edb4362dso163709185a.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 03:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788345867; x=1788950667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nucwFt37zXBwQFN0WyrwqjTBOM2Ta92KWejqAkDMZ8g=;
        b=PuL0c3nT0N1GrTDr/9FHfjgmzr9CN/D6yi3TVGq2Q4L9I+Ry/oqYErzDUA2RJdwpjd
         O7k1leFF6GYxeMsdR8Rx9IYuLdcSRjdXOs7AmOXPbuaQHVQHtpPRCMqJihDIdwxGVHHR
         D7nOzZzKdC3THa7jwFOjzLN3M8aXmXgKC/wQ4d54P/Ev0lwuB9kjZLWDlVUyIE9Bu5um
         SbAgclnLJ4U/23LZViGW8cKNyk/sFy98iGA8XC5rnIhv794Qi7GD3DR2gHl9dzSfgtPp
         qHWKkOsDEd/wg1LzP4mn5+n+TWN1sg6DmzN3Z24nKXc8oqbrvYmDdTkAV62K8WdrgvR+
         /Phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345867; x=1788950667;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nucwFt37zXBwQFN0WyrwqjTBOM2Ta92KWejqAkDMZ8g=;
        b=sn2nOP/1mKb9EudRWhKRyiCasyN6NMru2e6Dz99ajNW10Ncn9KlEJq04Vcn67N9SL/
         aRN6BhIzfiRhwIchpcFh3BnI8Rsb/irvGQXJJGryNKo+31EmgwJjtv736MBalYMvJ2IC
         Q5kLHAOURgZwgxjX9k1QqDVBJ6vnSPporxIwiofYvSfNnC0XW/TrS5NNMuiZyNkqd0GC
         dB7QUOxIJL48G7meU+PDuctlvGuLdGEWZv/GnFRYP3UlDk58WBvyWkWXaZansyLXDLTc
         6jV77IRpiysF74qymlcK5NbfR+rZBt0eMYoTyrUFDxaS7TinjOVpQIZJLrUGZm+B/64r
         xvgQ==
X-Forwarded-Encrypted: i=1; AHgh+RozHz7q4XEuSJh40iTFO3/hwZ+rRXGy89O/4H4xgg1p+wLwuGSKNupNThfDlumESPY1/QGVdxLrK9qGKs5IGgTc8w==@vger.kernel.org
X-Gm-Message-State: AFuF++lnjn7OV/GWVp2FN/qvKOuLDAcm7j0X/pwXpNkIVOYC6OqMKhmK
	HWjv53VjY3TtyiYxXVlykHrAEsiEm6nNjQ2V8tjiZcVyzNdyCYNUMmbQbHPfJ0m5wu+QQmqMLwH
	jbm4HBYtyt16XRaIq9gW+HeQH5PgU1jSEeuncBwhaR4lMGyfnlVMeK/Fqwr0E0jSgIlZXQG1LFg
	==
X-Gm-Gg: AR+sD13CeTJAlIa4Mshr+Xm6t8AoXhvO/hXCsvyfQp88l6KqQwdnsCRJkBUE+mwA9i2
	65YeMcNAQ1XwAIwkxOc+5wU60PU/Eu7szBOUwPpuD3o1BVzIIQXiUMMuPZab4nlUgbSzsoznWRY
	nnvSRHmvld39IedALLpv3y+S0Pe4P/cRb76MyTXllSaqmxWgcXWj0RvK/BZoGFoIN1rZLrpBiqm
	HvWxtu7+/ofhsNfCUof8CuY3ORgkd5FPlMY9r1lrhpw45eH7cmVEDpZHydVr0erUQqpebZ536Ee
	76jXFWE4reaHc0svQp8+3GdB2mFt58Y51QVR9xF4zx6sCt8W3SvTqoSk8XAy2HJWmP5lawLTUa1
	tgAGUSvmuDfbzDC2h7gCmyFDB1Rw=
X-Received: by 2002:a05:620a:25ce:b0:936:a5c3:512f with SMTP id af79cd13be357-93960fa200bmr388501585a.34.1788345866831;
        Wed, 02 Sep 2026 03:44:26 -0700 (PDT)
X-Received: by 2002:a05:620a:25ce:b0:936:a5c3:512f with SMTP id af79cd13be357-93960fa200bmr388495885a.34.1788345866263;
        Wed, 02 Sep 2026 03:44:26 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b759:bed7:f8b6:ccad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce7d04c69sm26431115e9.8.2026.09.02.03.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:44:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>, Biju <biju.das.au@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: (subset) [PATCH v5 0/4] Add RZ/G3L PWRRDY power sequencing support
Date: Wed,  2 Sep 2026 12:44:23 +0200
Message-ID: <178834586046.14988.12802695879784899486.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
References: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fLkJG5ae c=1 sm=1 tr=0 ts=6a97fe0b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=yC-0_ovQAAAA:8 a=EUspDBNiAAAA:8 a=_GP6QsbVdMz18HCjZqUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: AF4fQzXa9-Agt81vYQrds93K32bMZgX_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5NCBTYWx0ZWRfX6LiCY9ItC3oF
 QWlrzIdyjwjT2mkAJZ65vT6lnq1F72XL3aqAV05GdZ6C/2pCjWfCs5yeb9SYVrVYyL7LN9pMwXk
 BMzZKxiWLz3GSXgQphdWxogwmtGkRitIAm516s5zXibdVqufMGYbEQFESbpGiUTLJ2WfaJadj6O
 lsf4eiYvzerwcG4+M1qM5hi841ADkApYHLqVN37cuMussDeSdkRCkoeWL68jJjgFV5rzWcl05+0
 Ru6gdQzQ/W5XlIgcT7yQa0VxxhOn+9EUMaOSyIyxoPPmg1IwBubAttSUrrmoM9C7LgBAuipETb0
 02EwgjcNdAOwEI9cXKAHDty/J4bMv9OfXDLskMcJk8y1yZkHdrdWrnDM6KNF3Ztwj5MRPUvlyPH
 BF6jXdDmqTTeM9X7HZCqvgQKTCk7LJl3v3hTd4hSEBJYA6Iw1jl1pXgMuwCZ/fJVfSM7llIL4gL
 0NzOHUVwsITOo+tzYUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5NCBTYWx0ZWRfX3cw9lZUs7+7M
 dd8ThpfyQW3yFt/sPmlakibysOUrHTWaIoJa6SvaudqcYP2Ph0FtvqAb6PfNIMdPiHdCEYqOs7y
 mahQUzzPMzNapSj6LcewXauWkYhXQWw=
X-Proofpoint-GUID: AF4fQzXa9-Agt81vYQrds93K32bMZgX_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020094


On Wed, 26 Aug 2026 13:27:22 +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Hi All,
> 
> Some RZ SoCs (e.g. RZ/G3L) have a PWRRDY register that signals power
> readiness for various IPs (USB, DSI, CSI, etc.) to their respective
> controllers. This register is part of the SYSC IP. Add a dedicated
> power sequencing driver to handle these signals.
> 
> [...]

Applied, thanks!

[2/4] power: sequencing: Fix build issue with COMPILE_TEST
      https://git.kernel.org/brgl/c/3b54dbd119805361695cb50ca6a875f4c7518b74

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
