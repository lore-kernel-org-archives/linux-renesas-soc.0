Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012BB52BE28
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 14:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879490; cv=none; b=G3t+r3I2aa9ujOa73rNsW0EDcNcx8rWB1DA9Z43lPmXQRHErVY8/4J2UQTfrZhlhNT+N89leQ7dCSw2D0uRPoRjKVcYu26YW+bF8bcmW+4am19JN7PYUUMIaGGMpFcbk/0e83/0787vrGY60/KjZkKZJoyVFrEFdYxBD34wiRU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879490; c=relaxed/simple;
	bh=sE8TPiELHFO2ppGD2hV1DLfkNgk9nmF2XtHiis+j4eo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mqFFoGK66tZesgJ74rmVHmdUpBXELmW8ccRhqBdmY8bqma0cMp7GWxKqyha5lJIh3/iYxws6BaZmdNX1kAc97fdo/elafY8HMJ7hx0phMrOMyEF4vsoJqGzmi9Vl2P4jAVWFsFfSi38znHyLxb+72iviRADA+mveBdL0wG1Ferg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XqXIDB+g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtXkEpne; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqXIDB+g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NtXkEpne"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ej2Ig3482949
	for <linux-renesas-soc@vger.kernel.org>; Tue, 8 Sep 2026 14:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n9fI+3uuqSEn1CAJ5V2UHp
	vHJ7HK3inxXGPHLxZo4R4=; b=XqXIDB+gr0BMRD6SuGZ+rVndo1yL8rdC2uS/gY
	3Tt4Az/WxPU9uGaoS8X+zccg0SfWU0Obg+TISPoDk/EKupWanvbKMBpADSXdiC4m
	p2ejaX6lwNDegtKSQVbPemeb1y2eWzx9naE6m4fSkZn4tW92JzkS99p8sMqBQBVz
	uDIkt43cnmT7IIuUCNNYN7NpivqYquyCwolqn1lcWk29YduLYXq9Cc4hkUuw0nlQ
	TTXGDdgKu2xPPDnrs/b2gjc7a/PCq4hcGgN9hDVski2lWrF1JdMi7v6W7dKjd/If
	yz/Vce/9vmH2iiBkSZcugbQOwknRN+kHCoEIb9o9qWp1Qh8A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjagujpmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 14:57:56 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97c3796d17dso215857241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 07:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879476; x=1789484276; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n9fI+3uuqSEn1CAJ5V2UHpvHJ7HK3inxXGPHLxZo4R4=;
        b=NtXkEpnepUpijN3eQk1GvVU6KnXfBbzW/nZTGEja9gmGHkmxdMAS5cDTO8oRI85d61
         MvGizAKcx3jfOIV4SkR2K0SMfAkbscKlnW9nieJAmdr3JB16Kvv6AY5UITeUt9yFKbGs
         cljEdwIk7RPeLjhJhAjKS3pYGa7kxILwr6m8R5JsqPJMqiDxlJzn9HjW4STQS76NUxpk
         zCkGkRTZy1EggzazBr56Ep3P3iC0achPwWzO0AZh5fLbOQMQeEvsxxWTObEwda+UO4xc
         +gx4471u9MNAyaNjKMrykpOHqlzPSogEl6QDcDtmhD7jNKjK4hKOhFAZJKd6R8YAR8Qb
         qGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879476; x=1789484276;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n9fI+3uuqSEn1CAJ5V2UHpvHJ7HK3inxXGPHLxZo4R4=;
        b=S/JO4y7KUrKRGj1ZxnNDeUc/ZLURBp2jjEXZ5Hn9D+EvgnxORZDFPQQUO0CZ/mjm6Z
         r/KsJ02WKsOcPvnUY7R2MKiGQ4CY/ubgkxN7Hc4XOzchpf7fh2vyNzA2K0xpp6CN3f9F
         trUEatLw19/+ceb50fFRJNGX8OgGfRJeDXXHvQWPa0RDE48bpvfMVb6lg3xxq32zuad2
         UYBW5rR3lxIMtVjg8MjRkEuDaGf/LCoLzxh8h9u4KCapIWxaKKHkqFNGTKbu4VgXXNNb
         lEetWQ/LvI3zDFnAa+ebPTx7g82A3GCIlXyoTCII0e7Xzip4v2lJkyjRqLxZHHrXnX+8
         Oycw==
X-Forwarded-Encrypted: i=1; AKwUvBz8MHedVQ8spd3ag53248pshIhqdPbZNZXt7dQtLDRHfNKuwUhpmoIAZGhhqgvYjkIODtN/6TdYyc47EgoYRQBXjA==@vger.kernel.org
X-Gm-Message-State: AFuF++lrE8D23PnyGtIpesNiSv+6WIKw1l3+TZ+yFGY9XMoSGgc4aYg2
	v6ONDbBb+3f6lOmoVVN/kEYkfNalh7t+fWgKPuToSu8Yks3/lsiA3tymwqFti1WJCVd5M1sOAc9
	74BzbVF/72HSq3Yzt6eVA5ht3agkLXBkTL+uUItlnV7sKmEguJIB0UOcWDRO8AivnkeTXq/0LqA
	==
X-Gm-Gg: AYBFou2VT54ZTzCKgjZV43gz7DS2aj+CaHeNE/x1t8yY8oiQa3gczkC/Akna1fLZ/n/
	GcUTknCMGly8jxxU4w9T9psoRyAQuE8KRIGh3wM6gEkIYfzPBNKL3EL5aDxtrq1WPNiluFn6Zzt
	knxTLw/MU1451cQQ+GTEhYsdkyiOu7uzTC+eCu7+J1gJkzARGko6W2MousySR6WdEXe4IrJmP1g
	4ZEtZ5HQ6WoYQZwSl/LEzwjoIpjion3f5hCURVwR2O1SkI9UejuMaqGtP5FrD72Ii99UtfT6NNp
	s2CvbyfGq4GD42zBLbtb+OLR4rlGElLigYh9/YbYnEjDJ7RoLDMFaUJ2luvCw0w4vTXMZYoh1E7
	oCA55m3miWIaYpRyRANstDtcfymMu
X-Received: by 2002:a05:6102:5091:b0:786:7a59:a313 with SMTP id ada2fe7eead31-78a4aa368femr8743041137.13.1788879476047;
        Tue, 08 Sep 2026 07:57:56 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:786:7a59:a313 with SMTP id ada2fe7eead31-78a4aa368femr8743000137.13.1788879475380;
        Tue, 08 Sep 2026 07:57:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm25191276f8f.37.2026.09.08.07.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:57:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH net-next v14 00/10] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
Date: Tue, 08 Sep 2026 16:57:19 +0200
Message-Id: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE8ioGoC/3XTwU6EMBAG4FcxnO1mZtpOW0++h/HQQqskLiisR
 GP23Z0l0SXZciGBwteZzs9PM+epz3PzcPfTTHnp534c5AbN/V3TvsbhJau+kwcNAVlwYNRHOx7
 VHD1Z+67yMbbKGwbSNrYWqZHv3qdc+q8VfWqGfFJD/jo1z7Ly2s+ncfped1twXV/dgFBxF1SgN
 EUX2oKZ2T++9UOcxsM4vazcov8JBHI1QgvhrGOXAmmI6YYwVwKr3S1GiOKYGcC7Nscbwm6JahV
 WCMBOZx1j0f62Eb4ShKFGsBDGu4LgyTDmx3GeDx+f8U1ePR7kcjl5ARgQaQ/wHHVnEsXO61tgr
 cT9VcKggWuQE6gTCFBDMMntQH4DIdYgL5D1RC7JfAH9DhS2ULWiIFBrfdAmOy6FdiCEjUS6mji
 45CVooETaR+Q9Cq8UU3VgeEkvJldSsMliCXsUXSlXP3EZKCjJTsLcFgqAe5TeUFhv8PJDIIbiO
 YRcfCVHz+fz+Rf8udYWGAQAAA==
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7411;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sE8TPiELHFO2ppGD2hV1DLfkNgk9nmF2XtHiis+j4eo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoCJYv926YD4zHyNm0bbTfDMZG/I9sJFJyxelW
 xyQDzBOxGOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqAiWAAKCRAFnS7L/zaE
 w/gSD/90mVknRMA9TRu5UvFUGDj7iOuFMJ/WrEkqV8RHd7Ju2oaN7jrb6BF8OQN0yhqfmACjU1b
 8fE5QzpWIubObiGFiSErRk1RlW9UuPhQ/oDvKD/9CGqnc2F44XrS439Ur+PB3FTdiYlgs4S5e6Z
 2JtKTf8eQ4XcgL5AcokqO+/zacmUMp/fjV4d8iTK2/DAr+ALARMspRrmkEYlWouHh02325RIIzz
 ACgFpY6XKZglsJuLk4EqQSPcC4wdqOs+HKTxPAvHC0NYearfTQ1aMbTiueUZed3568Yhz77IkpW
 qtHzodIXVJyBFMVbW3ctQgmow7Mnal7IKfjn5p+JxX7gC2br+UAPPvaci/60GZpEgNe0R6NSOm+
 LjKqgksjE9ScasrKTGTzMJUgCbmVJLamHbMXLiOSP4qOMH/fZjCMUStsH75o4sftcF7mhYBSLoB
 3zZM+nVCGKHc9yIjLq6yu/IKwYSM+Pid0ULJ2TnhaZ0oh+Pve4twuCAbxj3snOyfrQJmXfaZ1++
 CGSN+rOIb0fRKIX0jLjDyeKlCnAb2EBz10d28TUN+r/SfJNO7zm7mDnxqutpYbAOJSNiFXmnLMo
 Yl1ain4ERst7G6p7tbTj9fGdvveqSlaHO5F7ahF9ykT8W4XPa/PD1Jvnj4xG9Qb8t29v9DBeFrG
 kdaCJm5cc6bNALg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=TqLWQjXh c=1 sm=1 tr=0 ts=6aa02274 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=LD4EYYuP07UOpJRtIbAA:9 a=054TBPTgsgP_hESR:21 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: aeOEeGiSNvw88roDyEQ4c89eaD_MNQZr
X-Proofpoint-ORIG-GUID: aeOEeGiSNvw88roDyEQ4c89eaD_MNQZr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfXyzaAJjMKnz6C
 c6wItYIV3zNiefKv5BScZybY4Exj5YJRmc2OdJ+OWwgRP1y5V0QxFPl9+zLuhpa0tAjoJ1mvrze
 F+IH9v7vWir+MQf3MBygTBMxaIDtx8Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX7Ra501QJGZnf
 7KPX5XIkpls0oj8lprJmqVabCyBesvLCyOwhnHZLo2OraAiCBmC6bFC8E0dQIgEJS8dFX+a09I4
 /Nlg2kccqqQdiaiSCbjB21AhsHq2L3AzDI7J1QGthE/2JCKCsj5stgzlSw3ak+pz8X8hKZuRoWI
 c1A3qhCinGFjpKIl4OtKTqh+hmWnEXXKfHyt0g95oaz04s/hsWSgUGKzGJbjKvV9FITyxjDCNZY
 Ho/rDJ9wefN+Obui29BTtBLjEIjFHWd0ekQEKa7OocVjvR/u2PDzhAbmzBba7iyNFXBQog7AzW8
 fCiA+ezib+nUko3F6+s5aLJ1wCzfNQePHjIkpPbYxMnF8TCk0WSE4Lk1Q7bPpe6Oi4VdQj4mv8v
 wepb78CmFC8R6LO9Odk/EyU+gzXcVn10lKOS/Qmlw8KhSbXktB22h5kpaB0mVWqsJibLBPq2vAB
 c8c1Ch2wleFlD1KP5eQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080161

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v14:
- let genpd's own runtime suspend/resume callbacks own the perf state entirely
  by calling dev_pm_genpd_set_performance_state() in set_mode()
  unconditionally in the sgmii PHY driver
- drop usleep_range() from the PHY driver when setting the state as the level
  setting is already synchronous
- add missing power-domains limits for ma35d1/k3-dwmac
- fix ordering of clearing the sgmii loopback
- configure the wrapper clocks synchronously in scmi setup
- Link to v13: https://patch.msgid.link/20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com

Changes in v13:
- Reapply OPP on speed change in the PHY driver
- Use linux/device-id/of.h instead of mod_devicetable.h
- Fix the "invalid PTP clock rate" warning on sa8255p
- Add commits necessary to allow correct link speed change with SCMI
- Link to v12: https://patch.msgid.link/20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com

Changes in v12:
- Drop the power-domain-names from the SGMII PHY DT bindings
- Add missing Kconfig dependency on PM for the new SGMII PHY driver
- Link to v11: https://patch.msgid.link/20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com

Changes in v11:
- Take a new approach: add a dedicated driver for the firmware-managed
  SGMII PHY and simplify changes made to the MAC driver
- Link to v10: https://patch.msgid.link/20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com

Changes in v10:
- Fix unit address in DT example
- Link to v9: https://patch.msgid.link/20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com

Changes in v9:
- Rebase on top of current linux-next again
- Link to v8: https://patch.msgid.link/20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com

Changes in v8:
- Rebase on top of recent changes in linux-next which required an
  extensive rework
- Drop partial R-b tags
- Link to v7: https://patch.msgid.link/20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com

Changes in v7:
- Restored the correct authorship after learning git uses .mailmap for
  the --author switch
- Rebased on top of changes from Russell
- Fixed resource management issues in error paths
- Link to v6: https://lore.kernel.org/r/20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com

Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org
- Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (10):
      net: phy: aquantia: fix system interface type not updated in forced mode
      dt-bindings: phy: document the serdes PHY on sa8255p
      phy: qcom: add the SGMII SerDes PHY driver for SCMI systems
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: set serdes mode before powerup
      net: stmmac: qcom-ethqos: update phy_mode to the resolved interface in mac_finish()
      net: stmmac: qcom-ethqos: fix SGMII loopback not set on resume after speed change
      net: stmmac: qcom-ethqos: reuse the address of ethqos_emac_driver_data
      net: stmmac: qcom-ethqos: factor out linux-level setup into a separate function
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml         |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          | 107 +++++++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/spacemit,k3-dwmac.yaml |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml |  50 ++++
 MAINTAINERS                                        |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 263 ++++++++++++++++-----
 drivers/net/phy/aquantia/aquantia_main.c           |   2 +-
 drivers/phy/qualcomm/Kconfig                       |  11 +
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c     | 115 +++++++++
 32 files changed, 566 insertions(+), 58 deletions(-)
---
base-commit: 65b4b0e4d071b9b74462a5871b3b3eeeffcff5ff
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

